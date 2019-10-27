$(function() {
	console.log("cccccc");
	// 获取验证码
	getCap();
	// 初始化数据
	initData();
	if($('.circliful').length != 0){
		$('.circliful').each(function(){
			var v = parseInt($(this).data('text'));
			if(v == "NaN"){
				v = 0;
			}
			
			$(this).find('.circle-text').text(v+'%');
		})
	}
	if($('.show').val() == "true"){
		showVoteData();
	}
	console.log($('.err').val());
	if($('.err').val() != ""){
		showAlert($('.err').val());
	}
});


function format(date,fmt){
	  var o = {
		        "M+": date.getMonth() + 1, //月份 
		        "d+": date.getDate(), //日 
		        "h+": date.getHours(), //小时 
		        "m+": date.getMinutes(), //分 
		        "s+": date.getSeconds(), //秒 
		        "q+": Math.floor((date.getMonth() + 3) / 3), //季度 
		        "S": date.getMilliseconds() //毫秒 
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
}

/**
 * 获取验证码
 */
function getCap() {
	console.log("getcap");
	var time = new Date();
	$('.img-code').attr('src', "validate_code?time=" + time);
}
/**
 * 初始化数据
 */
function initData() {
	console.log("aaaaa");
	$('#username').blur(validUsername);
	$('.img-code').click(getCap);
	$('#loginBtn').click(login_show);
	$('.closeBtn').click(login_close);
	$('#submits').click(register);
	$('#submit').click(login);
	;
	$('.keysadd').click(addOptions);
	$('.keyssub').click(subOptions);
	$('.sp_class_right').click(showClassRight);
	
	$('.close_tyle').click(classify_show);
	$('.upload_file').change(upload_img);
	$('.sp_complate').click(submitVoteFont);
	$("#tyle_floating_layer a").click(AddClassify);
	$(".vote_action").click(vote);
	$('.Img_Add').click(addImg);
	$('.Img_Upload').click(uploadVoteImg);
	$('#Img_Release').click(publish);
	$('.ReplyRe').click(reply);
	$('.SR_Submit').click(report);
	$('.Review_click').click(reviewFun);
	$("#close_data_analysis").click(closeDataAna);
	$(".voteAnalysis").click(voteAnalysis);
	$(".CrossHover1").click(sexShow);
	$(".CrossHover2").click(ageShow);
	$(".CrossHover3").click(cityShow);
	$(".delete").click(deleteVote);
	$("#Order_More").click(orderMore);
	$("#Classify_Close").click(classifyClose);
	$("#Frame_Search").click(search);
}


function search(){
	var key = $(this).siblings('#Frame_Title').val();
	console.log(key);
	$.ajax({
		type:"POST",
		url:"vote_search",
		data:{
			key:key
		},
		success:function(res){
			console.log(res);
			window.location.href = "http://localhost:8080/Online_Voting_System_20164206122/my.jsp";

		}
	});
}

function classifyClose(){
	$("#SC_Classify").css({
		display:"none"
	});
}

function orderMore(){
	$("#SC_Classify").css({
		display:"block"
	});
}

function deleteVote(){
	var voteId = $(this).attr('data-vid');
	console.log(voteId);
	$.ajax({
		type:"POST",
		url:"vote_delete",
		data:{
			voteId:voteId
		},
		success:function(res){
			console.log(res);
			let rs = JSON.parse(res);
			showAlert(rs.msg);
			if(rs.status == 1){
				location.reload();  
			}
		}
	})
}


function sexShow(){
	
	showData();
	var div = $('#vDataAnalysis1');
	div.css({
		display:"block"
	});
	if(div.children().length == 0){
		getSexData(window.voteId);
	}
	
}
function ageShow(){
	
	showData();
	var div = $('#vDataAnalysis2');
	div.css({
		display:"block"
	});
	console.log(window.update);
	if(div.children().length == 0){
		getAgeData(window.voteId);
	}
	
}
function cityShow(){
	
	showData();
	var div = $('#vDataAnalysis3');
	div.css({
		display:"block"
	});
	console.log(window.update);
	if(div.children().length == 0 ){
		getCityData(window.voteId);
	}
	
}


function showData(){
	
	$('.item-data-content').each(function(){
		$(this).css({
			display:"none"
		})
	})
	
	$(this).css({
		display:"block"
	})
	console.log(window.voteId);
	
}

function getSexData(voteId){
	
	$.ajax({
		type:"POST",
		url:"get_data",
		data:{
			voteId:voteId,
			classfity:"sex"
		},
		success:function(res){
			var rs = JSON.parse(res);
			var data = rs.data;
			var m = [];
			var f =[];
			Object.keys(data).forEach(key=>{
				m.push(data[key]["男"]);
				f.push(data[key]["女"]);
			});
			console.log(m);
			console.log(f);
			var key = Object.keys(rs.data);
			Highcharts.chart('vDataAnalysis1', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: 'Monthly Average Rainfall'
			    },
			    subtitle: {
			        text: 'Source: WorldClimate.com'
			    },
			    xAxis: {
			        categories:key,
			        crosshair: true
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: 'Rainfall (mm)'
			        }
			    },
			    tooltip: {
			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			        footerFormat: '</table>',
			        shared: true,
			        useHTML: true
			    },
			    plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0
			        }
			    },
			    series: [{
			        name: '男',
			        data: m

			    }, {
			        name: '女',
			        data:f

			    }]
			});
		}
	})
}

function getAgeData(voteId){
	var opt= ["0-20岁","20-30岁","30-45岁","50-60岁","60岁以上"];
	$.ajax({
		type:"POST",
		url:"get_data",
		data:{
			voteId:voteId,
			classfity:"age"
		},
		success:function(res){
			var rs = JSON.parse(res);
			var data = rs.data;
			var first = [];
			var second =[];
			var third = [];
			var four = [];
			var five = [];
			var i = 0;
			Object.keys(data).forEach(key=>{
				first.push(data[key]["0-20岁"]);
				second.push(data[key]["20-30岁"]);
				third.push(data[key]["30-45岁"]);
				four.push(data[key]["50-60岁"]);
				five.push(data[key]["60岁以上"]);
			});
			var key = Object.keys(rs.data);
			Highcharts.chart('vDataAnalysis2', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: 'Monthly Average Rainfall'
			    },
			    subtitle: {
			        text: 'Source: WorldClimate.com'
			    },
			    xAxis: {
			        categories:key,
			        crosshair: true
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: 'Rainfall (mm)'
			        }
			    },
			    tooltip: {
			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			        footerFormat: '</table>',
			        shared: true,
			        useHTML: true
			    },
			    plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0
			        }
			    },
			    series: [{
			        name: opt[0],
			        data: first,

			    }, {
			        name:opt[1],
			        data:second,

			    },{
			        name: opt[2],
			        data: third,

			    }, {
			        name:opt[3],
			        data:four,

			    },{
			        name: opt[4],
			        data: five,

			    }]
			});
		}
	})
}

function getCityData(voteId){
	var opt= ["一线城市","二线城市","三线城市","四线城市","五线城市"];
	$.ajax({
		type:"POST",
		url:"get_data",
		data:{
			voteId:voteId,
			classfity:"city"
		},
		success:function(res){
			var rs = JSON.parse(res);
			var data = rs.data;
			var first = [];
			var second =[];
			var third = [];
			var four = [];
			var five = [];
			var i = 0;
			Object.keys(data).forEach(key=>{
				first.push(data[key]["一线城市"]);
				second.push(data[key]["二线城市"]);
				third.push(data[key]["三线城市"]);
				four.push(data[key]["四线城市"]);
				five.push(data[key]["五线城市"]);
			});
			var key = Object.keys(rs.data);
			Highcharts.chart('vDataAnalysis3', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: 'Monthly Average Rainfall'
			    },
			    subtitle: {
			        text: 'Source: WorldClimate.com'
			    },
			    xAxis: {
			        categories:key,
			        crosshair: true
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: 'Rainfall (mm)'
			        }
			    },
			    tooltip: {
			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			        footerFormat: '</table>',
			        shared: true,
			        useHTML: true
			    },
			    plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0
			        }
			    },
			    series: [{
			        name: opt[0],
			        data: first,

			    }, {
			        name:opt[1],
			        data:second,

			    },{
			        name: opt[2],
			        data: third,

			    }, {
			        name:opt[3],
			        data:four,

			    },{
			        name: opt[4],
			        data: five,

			    }]
			});
		}
	})
}
function voteAnalysis(){
	var voteId = $(this).attr("data-id");
	window.voteId = voteId;
	window.update = true;
	console.log(window.update);
	console.log(voteId);
	$('#vDataAnalysis1').children().remove();
	$('#vDataAnalysis2').children().remove();
	$('#vDataAnalysis3').children().remove();
	$("#data_analysis").css({
		display:"block"
	});
	if($('#vDataAnalysis1').children().length == 0 ){
		getSexData(voteId);
	}
}


function closeDataAna(){
	$("#data_analysis").css({
		display:"none"
	})
}
/**
 * 处理回复数据
 * @returns
 */
function reviewFun(){
	console.log(this);
		var date = new Date();
		date = format(date,"yyyy-MM-dd");
		var $this = $(this);
		var userId = $('.list-p-actor').text();
		var content = $(this).parents('.reply').find('textarea').val(),
			quoteId = $(this).parents('.Review_one_level').find('.username').text(),
			voteId =  $('.voteId').val();
		var html =	`<div class="replycontent">
		<p class="row1">
		<a href="">
		<img
			width="100%" height="100%"
			src="http://www.wanyan.com/images/m_head.png">
		</a>
	</p>
	<div class="row2">
		<p class="col1">
			<a href="/vote/toUsersVote?targetUserID=037b29120cd9d944"
				target="_blank">${userId}</a> <span>${date}</span>
		</p>
		<p class="col2">${content}</p>
	</div>
	</div>`;

		console.log(content,quoteId,voteId);
		$.ajax({
			type:"POST",
			url:'report_reply',
			data:{
				content:content,
				quoteId:quoteId,
				voteId:voteId
			},
			success:function(res){
				console.log(res);
				var rs = JSON.parse(res);
				if(rs.status == 1){
					reply();
					$('.Review_click').val('');
					console.log($(this).parents('.Review_one_level'));
					$(this).parents('.Review_one_level').append(html);
				}
			}
		});
	}
	





/**
 * 评论方法
 * 
 * @returns
 */

function report(){
	var date = new Date();
	date = format(date,"yyyy-MM-dd");
	var userId = $('.list-p-actor').text();
	var content = $(this).siblings('textarea').val(),
	voteId = $('.voteId').val();
	console.log(content,voteId);
	var html = `
	<div class="Review_Item">
	<div class="Review_Left Evaluation_Info" data-member="0"
		data-id="e4a14f86cd326bd5" data-img="/images/m_head.png"
		data-url="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
		data-name="aimeiliew">
		<a href="" class="username"
			target="_blank"><img src="http://www.wanyan.com/images/m_head.png"> </a>
	</div>
	<div class="Review_Right">
		<div class="Review_one_level">
			<p class="row1">
				<a href="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
					target="_blank">${userId}</a><span>${date}</span>
			</p>
			<p class="row2">${content}</p>

			<a class="row3 ReplyRe" data-byid="197481" onclick="reply()">回复</a>

			<div class="row3 reply" id="TwoSub_39646" style="display: block;">
				<p class="col1">
					<textarea rows="" cols="" placeholder="我来说点啥..."
						class="rep_area"></textarea>
				</p>
				<p class="col2">
					<a href="javascript:void(0);"
						class="A Fillet_Five butt_hover Review_click" onclick="reviewFun()"
						data-commentsource="1" data-id="39646">评论</a> 
				</p>
			</div>

		</div>

	</div>
</div>`

	$.ajax({
		type:"POST",
		url:"report_comment",
		data:{
			content:content,
			voteId:voteId
		},
		success:function(res){
			console.log(res);
			var rs = JSON.parse(res);
			if(rs.status == 1){
				console.log("aaa");
				$('.SR_Box').val('');
				$('.Review_Frames').append(html);
			}
		}
	});
}


/**
 * 回复样式设计
 */

function reply(){
	var reply = $(this).siblings('.reply');
	
	if(reply.css('display') == "block"){
		console.log("block");
		reply.css({
			display:"none"
		})
	}else{
		console.log("none");
		reply.css({
			display:"block"
		})
	}
}

/**
 * 发布图片投票
 */
function publish(){
	
	var title = $("#Img_BoxA").val(),
		desc = $("#Img_BoxC").val(),
		time = $(".flatpickr ").val(),
		keys = $(".Img_BoxD").val(),
		select = $("input[name='select']:checked").val(),
		classfity = $("#vote_Classification").text();
	var img = "";
	var imgdesc = "";
	$('.show_upload_img ').each(function(){
		img = img + $(this).attr('src') + ',';
		imgdesc = imgdesc + $(this).siblings('.filedesc').val() + ',';
	})

	img = img.substring(0,img.lastIndexOf(','));
	imgdesc = imgdesc.substring(0,imgdesc.lastIndexOf(','));
	
	console.log(img,imgdesc);
	
	console.log(title,desc,time,keys,select,classfity);
	$.ajax({
		type:"POST",
		url:"vote_vote_img",
		data:{
			title:title,
			desc:desc,
			keys:keys,
			img:img,
			imgdesc:imgdesc,
			endtime:time,
			select:select,
			classfity:classfity
		},
		success:function(res){
			console.log(res);
			var rs = JSON.parse(res);
			showAlert(rs.msg);
			if(rs.status == 1){
				console.log("sucess");
			}
		}
	})
	
}

/**
 * 上传图片投票图片
 */
function uploadVoteImg(){
	
	var data = new FormData();
	var file = $(this)[0];
	
	$('.fileUpload').each(function(index,item){
		var item = $(this)[0];
		console.log(item.files[0]);
		data.append("file"+index,item.files[0]);
	});
	
	showAlert("正在上传");
	$.ajax({
		type : "POST",
		url : "img_upload",
		data : data,
		contentType : false,
		processData : false,// 这个很有必要，不然不行
		dataType : "json",
		mimeType : "multipart/form-data",
		success : function(res) {
			console.log(res);
			var rs = res;
			if(rs.status == 1){
				window.imgurl = rs.url;
				var url = rs.url.split(",");
				var showimg = $(".show_upload_img");
				console.log(showimg);
				for(var i = 0; i<url.length;i++){
					showimg.eq(i).attr('src',url[i]);
					showimg.addClass("show");
				}
				showAlert("上传成功");
			}else{
				showAlert("上传失败,请重试");
			}
		}
	})
	
}

function addImg(){
	console.log("bbb");
	var html = `<div class="Img_List">
	<p class="Fillet_Style Layer_Img A">
	<input type="file" class="fileUpload" /> <img src=""
		style="display:none" class="show_upload_img" /> <input
		type="text" class="filedesc"/>
</p>
</div>`;
	console.log(html);
	$(this).before(html);
}

function vote(){
	var _this = $(this);
	var checkbox = $('input[type=Checkbox]');
	var value = _this.siblings("h3").text();
	var oid =$('.options_id').val();
	var vid = $('.voteId').val();
	console.log(value);
	var isMult = 0;
	console.log(checkbox.length);
	if(checkbox.length == 1){
		console.log("复选框 length == 1")
	}else{
		isMult =1;
		value  = "";
		 $('input[name="addoptions"]:checked').each(function(){
	           value  = value  + $(this).val() +',';
	           console.log($(this).val());
	     });
		value = value.substring(0,value.lastIndexOf(','));		 
	}
	console.log(value);
	console.log(oid);
	$.ajax({
		type:"POST",
		url:"vote_action",
		data:{
			oid:oid,
			vid:vid,
			opt:value,
			isMult:isMult
		},
		success:function(res){
			console.log(res);
			var rs = JSON.parse(res);
			showAlert(rs.msg);
			if(rs.status == 1){
				location.reload();  
			}
		}
	})
}

function showVoteData(){
	console.log("showVoteData");
	$('.vote_action').css({
		backgroundColor:"#969090",
		cursor:"no-drop",
	});
	$('.vote_action').unbind("click");
	$('.vote_pro').each(function(value,item){
		let $this = $(this);
		console.log($(this));
		let parwidth = $this.parent().width();
		console.log(parwidth);
		console.log(parseInt($this.data('vote'))/100);
		let width =( parseInt($this.data('vote'))/100)*parwidth;
		console.log(width);
		let wid = 0;
		let timer = setInterval(function(){
			wid ++;
			$this.css('width',wid);
			if(wid>=width){
				clearInterval(timer);
			}
		},10);
	})
	
	
	
	var data = [];
	
	$('#vDataAnalysisDouble').css({
		display:"block"
	})
	console.log("aaa");
	$('.vote_opt').each(function(){
		var opt = $(this).find('.options').text();;
		var per = parseFloat($(this).find('.vote_pro').attr('data-vote'));
		console.log(opt,per);
		data.push({
			name: opt,
			y: per
		})
	})
	
	console.log(data);
	Highcharts.chart('vDataAnalysisDouble', {
		chart: {
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
		},
		title: {
			text: 'Browser market shares in January, 2018'
		},
		tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
					enabled: true,
					format: '<b>{point.name}</b>: {point.percentage:.1f} %',
					style: {
						color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
					}
				}
			}
		},
		series: [{
			name: 'Brands',
			colorByPoint: true,
			data: data
		}]
	});
	
	
	
}


/**
 * 添加分类标签
 */
function AddClassify(){
	
	var value = $(this).text();
	$('.sp_class_right').html(value);
	
}

function submitVoteFont(){
	
	var title = $('.sp_txttitle').val(),
		img = $('.show_upload_img').attr('src'),
		desc = $('.desc').val(),
		select = $("input[name='select']:checked").val(),
		endtime = $('.flatpickr').val(),
		visible =$('input[name=Checkbox]:checked').val(),
		classfity = $('.sp_class_right').text(),
		key = $(".sp_dict_txt").val();

	console.log(title,img,desc,select,endtime,visible,key);
	var keys = "";
	$('.ksystext').each(function(index,item){
		keys += $(this).val()+',';
	});
	
	keys = keys.substring(0, keys.lastIndexOf(','));
	var vid = $(this).attr('data-vid');
	console.log(vid);
	if(!vid){
		$.ajax({
			type:"POST",
			url:"vote_votefont",
			data:{
				title:title,
				img:img,
				desc:desc,
				select:select,
				endtime:endtime,
				visible:visible,
				key:key,
				options:keys,
				classfity:classfity
			},
			success:function(res){
				console.log(res);
				var rs = JSON.parse(res);
				if(rs.state == 1){
					window.location.href = "http://localhost:8080/Online_Voting_System_20164206122/index.jsp";
				}else{
					showAlert(rs.msg);
				}
			}
		})
	}else{
		var oid = $(this).attr('data-oid');
		console.log(vid);
			$.ajax({
				type:"POST",
				url:"vote_modify",
				data:{
					vid:vid,
					oid:oid,
					title:title,
					img:img,
					desc:desc,
					select:select,
					endtime:endtime,
					visible:visible,
					key:key,
					options:keys,
					classfity:classfity
				},
				success:function(res){
					console.log(res);
					var rs = JSON.parse(res);
					if(rs.state == 1){
						window.location.href = "http://localhost:8080/Online_Voting_System_20164206122/index.jsp";
					}else{
						showAlert(rs.msg);
					}
				}
		})
	}
	
}

function subOptions(){
	var parent = $('.keysadd');
	var key = parent.length-1;
	var html = $('.options_ul li').eq(key).remove();
}

function upload_img() {
	var data = new FormData();
	var file = $(this)[0];
	data.append("file", file.files[0]);
	showAlert("正在上传");
	$.ajax({
		type : "POST",
		url : "img_upload",
		data : data,
		contentType : false,
		processData : false,// 这个很有必要，不然不行
		dataType : "json",
		mimeType : "multipart/form-data",
		success : function(res) {
			console.log(res);
// let rs = JSON.parse(res);
			var rs = res;
			if(rs.status == 1){
				var showimg = $('.show_upload_img');
				showimg.attr("src",rs.url);
				showimg.addClass('show');
				showAlert("上传成功");
			}else{
				showAlert("上传失败,请重试");
			}
		}
	})
}
function classify_show() {
	$("#tyle_floating_layer").removeClass('show');
}

function showClassRight() {
	console.log("aaaaaa");
	$("#tyle_floating_layer").addClass('show');
}
function addOptions() {
	var html = "<li class='keitems'><input type='text' placeholder='点击此处添加选项' class='ksystext' maxlength='24'><a class='keysadd'></a><a class='keyssub'></a></li>";
	$('.options_ul').append(html);
}

/**
 * 登录方法
 */
function login() {
	var username = $("#phone").val();
	var pwd = $("#password").val();
	var action = $("#nav_action");
	var code = $('#verify').val();
	console.log(username, pwd);
	$.ajax({
				type : "POST",
				url : "v1_user_login",
				data : {
					username : username,
					pwd : pwd,
					code:code
				},
				success : function(data) {
					console.log(data);
					var rs = JSON.parse(data);
					if (rs.status == 1) {
						login_close();
						console.log(action);
						var html = "<li class='login'><a href='#' class='btn btn-default btn-login' id='loginExam'>"
								+ username
								+ "</a></li><li><a href='/user/voteimg/index/type/all.html' class='btn btn-primary btn-register' title='发起投票'>发起投票</a></li>";
						action.html(html);
					} else if(rs.status == 0){
						showAlert(rs.msg);
					} else if(rs.status == 2){
						window.location.href = "http://localhost:8080/Online_Voting_System_20164206122/behind_Platform.jsp";
					}
				}
			})
}
/**
 * 注册方法
 */
function register() {
	var username = $('#username').val(), pwd = $('#password').val(), spwd = $(
			'#enpassword').val(), phone = $('#mobilenumber').val(),city = $('#select-country  option:selected').val(),
			sex = $("#select_sex  option:selected").val(),age = $("#select_age  option:selected").val(),
			apply = $("#select_apply  option:selected").val();
	console.log(city,age,sex);
	console.log(apply);
	const
	TEL_REGEX = /^1(3|4|5|7|8)\d{9}$/;
	if (window.oldusername == username) {
		showAlert("对不起，该用户名不可用");
		return;
	}
	if (username.length < 4 || username.length > 20) {
		showAlert("对不起，用户名格式 错误");
		return;
	}
	if (pwd != spwd) {
		showAlert("对不起，两次密码不一致，请重新填写");
		return;
	}
	if (!TEL_REGEX.test(phone)) {
		showAlert("对不起，手机号格式错误");
		return;
	}

	
			$.ajax({
				type : "POST",
				url : "register",
				data : {
					username : username,
					pwd : pwd,
					phone : phone,
					sex:sex,
					age:age,
					city:city,
					apply:apply
				},
				success : function(data) {
					console.log(data);
					var rs = JSON.parse(data);
					if (rs.status == 1) {
						window.location.href = "http://localhost:8080/Online_Voting_System_20164206122/index.jsp";
					} else {
						showAlert(rs.msg);
					}
				}
			})
}
/**
 * 显示登陆界面
 */
function login_show() {
	$('#login_windows').addClass("show");
	$('#layui-layer-shade1').addClass('show');
}
/**
 * 关闭登陆界面
 */
function login_close() {
	$('#login_windows').removeClass("show");
	$('#layui-layer-shade1').removeClass('show');
}
/**
 * 显示提示信息
 * 
 * @param msg
 */
function showAlert(msg) {
	console.log(msg);
	if(msg == '' || !msg){
		return;
	}
	var alert = $('.alert');
	var time = 3;
	alert.html(msg);
	alert.css({
		display : "block"
	})
	var timer = setInterval(function() {
		time--;
		console.log("abc");
		if (time == 0) {
			alert.css({
				display : "none"
			})
			clearInterval(timer);
		}
	}, 1000)
}
/**
 * 验证用户名是否重复
 */
function validUsername() {
	var val = $(this).val();
	if (val != '') {
		$.ajax({
			url : 'v1_user_isRepeat?username=' + $(this).val(),
			success : function(data) {
				console.log(data);
				var rs = JSON.parse(data);
				if (rs.status == 0) {
					window.oldusername = val;
					showAlert(rs.msg);
				}
			}
		})
	}
}