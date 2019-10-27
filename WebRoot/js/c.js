/*
 *  Copyright 2014-11-03
 *  Author sunyuan
 */
! function(a) {
	console.log(a);
	a.fn.circliful = function(b) {
		console.log(b);
		var c = a.extend({
			foregroundColor: "#556b2f",
			backgroundColor: "#eee",
			textColor: "#666",
			fillColor: !1,
			width: 15,
			dimension: 200,
			size: 15,
			percent: 50,
			animationStep: 1
		}, b);
		console.log(this);
		return this.each(function() {
			function b(a) {
				q.clearRect(0, 0, p.width, p.height), q.beginPath(), q.arc(r, s, u, w, v, !1), q.lineWidth = g - 1, q.strokeStyle =
					l, q.stroke(), C && (q.fillStyle = C, q.fill()), q.beginPath(), q.arc(r, s, u, -A, z * a - A, !1), q.lineWidth =
					g, q.strokeStyle = k, q.stroke(), j > x && (x += y, requestAnimationFrame(function() {
						b(Math.min(x, j) / 100)
					}))
			}
			var d = "",
				e = "",
				f = "",
				g = "",
				h = 0,
				i = 0,
				j = 100,
				k = "",
				l = "",
				m = "",
				n = "",
				o = 0;
			a(this).addClass("circliful"), d = void 0 != a(this).data("dimension") ? a(this).data("dimension") : c.dimension,
				g = void 0 != a(this).data("width") ? a(this).data("width") : c.width, h = void 0 != a(this).data("fontsize") ?
				a(this).data("fontsize") : c.size, void 0 != a(this).data("percent") ? (i = a(this).data("percent") / 100, j = a(
					this).data("percent")) : i = c.percent / 100, k = void 0 != a(this).data("fgcolor") ? a(this).data("fgcolor") :
				c.foregroundColor, l = void 0 != a(this).data("bgcolor") ? a(this).data("bgcolor") : c.backgroundColor, m = void 0 !=
				a(this).data("txtcolor") ? a(this).data("txtcolor") : c.textColor, o = void 0 != a(this).data("animation-step") ?
				parseFloat(a(this).data("animation-step")) : c.animationStep, void 0 != a(this).data("text") ? (e = a(this).data(
						"text"), void 0 != a(this).data("icon") && (n = '<i class="fa ' + a(this).data("icon") + '"></i>'), void 0 !=
					a(this).data("type") ? (B = a(this).data("type"), "half" == B ? (a(this).append(
						'<span class="circle-text-half" style="color: ' + m + '">' + n + e + "</span>"), a(this).find(
						".circle-text-half").css({
						"line-height": d / 1.45 + "px",
						"font-size": h + "px"
					})) : (a(this).append('<span class="circle-text" style="color: ' + m + '">' + n + e + "</span>"), a(this).find(
						".circle-text").css({
						"line-height": d + "px",
						"font-size": h + "px"
					}))) : (a(this).append('<span class="circle-text" style="color: ' + m + '">' + n + e + "</span>"), a(this).find(
						".circle-text").css({
						"line-height": d + "px",
						"font-size": h + "px"
					}))) : void 0 != a(this).data("icon"), void 0 != a(this).data("info") && (f = a(this).data("info"), void 0 != a(
					this).data("type") ? (B = a(this).data("type"), "half" == B ? (a(this).append(
					'<span class="circle-info-half">' + f + "</span>"), a(this).find(".circle-info-half").css({
					"line-height": .9 * d + "px"
				})) : (a(this).append('<span class="circle-info">' + f + "</span>"), a(this).find(".circle-info").css({
					"line-height": 1.25 * d + "px"
				}))) : (a(this).append('<span class="circle-info">' + f + "</span>"), a(this).find(".circle-info").css({
					"line-height": 1.25 * d + "px"
				}))), a(this).width(d + "px");
			var p = a("<canvas></canvas>").attr({
					width: d,
					height: d
				}).appendTo(a(this)).get(0),
				q = p.getContext("2d"),
				r = p.width / 2,
				s = p.height / 2,
				t = 360 * i,
				u = (t * (Math.PI / 180), p.width / 2.5),
				v = 2.3 * Math.PI,
				w = 0,
				x = 0 === o ? j : 0,
				y = Math.max(o, 0),
				z = 2 * Math.PI,
				A = Math.PI / 2,
				B = "",
				C = !1;
			if (void 0 != a(this).data("type") && (B = a(this).data("type"), "half" == B)) var v = 2 * Math.PI,
				w = 3.13,
				z = 1 * Math.PI,
				A = Math.PI / .996;
			C = void 0 != a(this).data("fill") ? a(this).data("fill") : c.fillColor, b(x / 100)
		})
	}
}(jQuery);

var c = $('.myStathalf');
console.log(c);
c.circliful();