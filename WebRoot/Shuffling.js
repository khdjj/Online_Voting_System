(function($){
	var Shuffling = function($element,options){
		var self = this;
		this.setting = {  //默认配置参数
				model:"slide",
				delay:8000,
				posterWidth:750,
				posterHeight:400,
				width:1000,
				height:400,
				autoPlay:true,
				scale:0.8,
				paginationModel:"circular" // circular or square
		};
	
		this.prev = $element.find(".prev-btn");
		this.next = $element.find(".next-btn");
		this.sliders = $element.find(".slider");
		this.items = $element.find(".img-items");
		this.itemLength =  this.items.length;
		this.curIndex = -1;  //slide模式下当前播放的图片编号 
		this.lastIndex = 0;//slide模式下上一个播放的图片编号 
		var container = $element.parent(".container");

		var o = options || {};
		$.extend(this.setting,o);//将参数设置为用户参数
		
		//设置容器的宽度
		container.css({
			width:this.setting.width,
			height:this.setting.height
		})
		
		//设置上下按钮的位置
		this.SetBtnLocation();
		
		if(this.setting.model === "slide"){ //模式不同其初始化也不同
			this.slide_init();
		}else if(this.setting.model === "carousel"){
			this.carousel_init();
		}	
		
		if(this.setting.autoPlay){  //自动播放
			this.autoPlay();
			this.prev.hover(function(){  //当鼠标处于上下按钮时，停止轮播
				clearInterval(self.timer);
			},function(){
				self.autoPlay();
			});	
			this.next.hover(function(){
				clearInterval(self.timer);
			},function(){
				self.autoPlay();
			});	
		}
		
		this.prev.click(function(){
			if(self.setting.model === "slide"){
				self.slideLeftRotate();
			}else if(self.setting.model === "carousel"){
				self.carouselLeftRotate();
			}
		});
		this.next.click(function(){
			if(self.setting.model === "slide"){
				self.slideRightRotate();
			}else if(self.setting.model === "carousel"){
				self.carouselRightRotate();
			}
		});
	};
	
	Shuffling.prototype = {
		
		autoPlay:function(){//自动播放
			var self = this;
			this.timer = setInterval(function(){  //下面两个模式默认都是向右播放
				if(self.setting.model === "slide"){
					self.slideRightRotate();
				}else if (self.setting.model === "carousel"){
					self.carouselRightRotate();
				}
			},3000);
		},
		carouselRightRotate:function(){
			var self = this,
				zIndexArr = [];
			this.items.each(function(){
				var $this = $(this);
				var next = $this.next().get(0) ? $this.next() : self.firstitem;
				var w = next.width(),
					h = next.height(),
					zIndex = next.css("z-index"),
					o = next.css("opacity") || next.css("filter"),
					top = next.css("top"),
					left = next.css("left");
					zIndexArr.push(zIndex);
				$this.animate({
					width:w,
					height:h,
					zIndex:zIndex,
					opacity:o,
					top:top,
					left:left,
				},self.setting.delay);
			});
			this.items.each(function(i){
				$(this).css({"z-index":zIndexArr[i]});
			});		
		},
		carouselLeftRotate:function(){  //carousel模式下向左播放
			var self = this,
				zIndexArr = [];
			this.items.each(function(){
				var $this = $(this);
				var left = $this.prev().get(0) ? $this.prev() : self.lastitem;
				var w = left.width(),
					h = left.height(),
					zIndex = left.css("z-index"),
					o = left.css("opacity") || left.css("filter"),
					top = left.css("top"),
					left = left.css("left");
					zIndexArr.push(zIndex);
				$this.animate({
					width:w,
					height:h,
					zIndex:zIndex,
					opacity:o,
					top:top,
					left:left,
				},self.setting.delay);
			});
			this.items.each(function(i){
				$(this).css({"z-index":zIndexArr[i]});
			});	
		},
		
		slideRightRotate:function(){   //slide模式下向右轮播 
			var self = this;
			this.curIndex++;
			
				if(this.curIndex === this.itemLength){
					this.curIndex = 0;
				}
				this.setpagBtnClass();
				this.lastIndex = this.curIndex;
				this.sliders.css({
					left:-(this.curIndex * this.setting.width)
				});
				
		},
		
		slideLeftRotate:function(){  //slide模式下向左轮播 
			
			this.curIndex--;
			var self = this;
			
				if(this.curIndex === -1){
					this.curIndex = this.itemLength-1;
				}
				this.setpagBtnClass(); //设置当前分布按钮的样式 
				this.lastIndex = this.curIndex;
				this.sliders.css({
					left:-(this.curIndex * this.setting.width)
				});
				
				
		},
		setpagBtnClass:function(){
			
			if(this.setting.paginationModel === "circular"){
				
				this.pagBtns.eq(this.lastIndex).removeClass("active_circular");
				this.pagBtns.eq(this.curIndex).addClass("active_circular");
				
			}else if(this.setting.paginationModel === "square"){
				
				this.pagBtns.eq(this.lastIndex).removeClass("active_square");
				this.pagBtns.eq(this.curIndex).addClass("active_square");
			}
		},
		
		slide_init: function(){ //slide模式初始化
			var self = this;
			
			this.sliders.css({
				width:this.itemLength*this.setting.width,
				height:this.setting.height
			});
			
			this.items.each(function(){
				$(this).css({
					width:self.setting.width,
					height:self.setting.height,
					float:"left",
				});
			});
			
			//设置分页标记的位置
			this.SetPaginationLocation();
			
		},
		
		
		
		//幻灯片一定按顺序进行存放，不按顺序存放则会出幻灯片顺序播放异常
		carousel_init:function(){
			
			var self = this;
			this.firstitem = this.items.first();
			this.lastitem = this.items.last();
			var sliceLen = Math.floor(this.itemLength/2),
				zIndexRight = zIndexLeft = sliceLen,
				sliceItem  = this.items.slice(1);
				rightSlice  = sliceItem.slice(0,sliceLen),//右边的幻灯片
				leftSlice = sliceItem.slice(sliceLen);//左边的幻灯片
				
			var  rw = this.setting.posterWidth,
				 rh = this.setting.posterHeight;
				
			var fixOffsetLeft = (this.setting.width-this.setting.posterWidth)/2,
				gap = fixOffsetLeft / sliceLen;
			
			
			this.items.each(function(){
				$(this).css({
					position:"absolute"
				});
			});
			
			rightSlice.each(function(index){
				rw = rw * self.setting.scale;
				rh = rh * self.setting.scale;
				var o = index;
				$(this).css({
					width:rw,
					height:rh,
					zIndex:zIndexRight--,
					left:fixOffsetLeft+self.setting.posterWidth+(++index)*gap-rw,
					opacity:1/++o,
					top:(self.setting.height-rh)/2,
				});
			});
		
		
			var lw = rightSlice.last().width(),
				lh = rightSlice.last().height();
			var o = sliceLen;
			leftSlice.each(function(index){
				var j = index;
				$(this).css({
					width:lw,
					lh:lh,
					zIndex:j++,
					left:gap*index,
					top:(self.setting.height-lh)/2,
					opacity:1/o--,
				});
				
				lw = lw / self.setting.scale;
				lh = lh / self.setting.scale;
			});
			
			this.firstitem.css({ //设置第一张幻灯片的样式 
				width:this.setting.posterWidth,
				height:this.setting.posterHeight,
				zIndex:sliceLen+1,
				top:0,
				left:fixOffsetLeft
			})
			
		},
		
		SetBtnLocation:function(){   //设置上下按钮的位置
			var height = this.setting.height/2;
			this.prev.css({
				top:height
			});
		
			this.next.css({
				top:height
			})
		},
		
		SetPaginationLocation:function(){   //根据图片个数增加相同个数的圆形或方形标记
			this.pag = $(".pagination-wrap");
			var str = "";
			for(var i=0;i<this.itemLength;i++){
				str += "<li></li>";
			}
			this.pag.find("ul").html(str);
			this.pagBtns = this.pag.find("li");
			this.pag.css({
				left:this.setting.width/2-30,
				top:this.setting.height-40
			});
		}
	};
	Shuffling.init = function($element,options){
		if(!s){
			s = new Shuffling($element,options);
		}else{
			s.autoPlay();
		}
	}
	Shuffling.destory = function(){
		clearInterval(s.timer);
	}
	window.Shuffling = Shuffling;
	
})(jQuery);

var s;
