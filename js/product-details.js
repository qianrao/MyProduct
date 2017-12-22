(()=>{
	var lid=location.search.split("=")[1];
	if(lid!=undefined){
		ajax(
			"get",
			"data/details.php?lid="+lid,
			""
		).then(data=>{
			var details=data.details,
				family=data.family;
			//console.log(details,family);
			/*功能一:加载左上角图片*/
			var mImg=document.getElementById("mImg"),
				largeDiv=document.getElementById("largeDiv"),
				icon_list=document.getElementById("icon_list");
			//console.log(mImg,largeDiv,icon_list);
			mImg.src=details.pics[0].md;
			largeDiv.style.backgroundImage=`url(${details.pics[1].lg})`;
			var html="";
			for(var pic of details.pics){
				html+=`<li class="i1">
					<img src="${pic.sm}" data-md="${pic.md}" data-lg="${pic.lg}">
					</li>`
			}
			
			icon_list.innerHTML=html;

			/*功能二：加载右上角商品基本信息*/
			var title=document.querySelector("#show-details>h2>a"),
				price=document.querySelector("#show-details>.price>.stu-price>span"),
				promise=document.querySelector("#show-details>.price>.promise"),
				spec=document.querySelector("#show-details>.spec>div");
			console.log(title,price,promise,spec);
			title.innerHTML=details.title;
			price.innerHTML="￥"+details.price;
			promise.innerHTML+=details.promise;

			var html="";
			//遍历当前系列下的商品列表
			for(var d of family.cosmetic_list ){
				if(d.lid!=details.lid)
				html+=`<a href="product-details.html?lib=${d.lid}" >${d.spec}</a>`;
				else
				html+=`<a href="product-details.html?lib=${d.lid}" class="active">${d.spec}</a>`
			}
			spec.innerHTML=html;
			
			/*****************放大镜***************/
			/******移动小图片*****/
			var aForward=document.querySelector("#preview>h1>.forward");
			var aBackward=document.querySelector("#preview>h1>.backward");
			var moved=0,LIWIDTH=62;
			aForward.onclick=function(){
				if(this.className.indexOf("disabled")==-1){
					moved++;
					move();
				}
			};
			aBackward.onclick=function(){
				if(this.className.indexOf("disabled")==-1){
					moved--;
					move();
				}
			};
			function move(){
				icon_list.style.left=-moved*LIWIDTH+20+"px";
				checkA();
			}
			function checkA(){
				//如果当前商品的图片张数小于<=5 设置禁用
				if(details.pics.length-moved==5){
					aForward.className="forward disabled"//因此在事件里添加判断
				}
				else if(moved==0){
					aBackward.className="backward disabled"
				}
				else{
					aForward.className="forward";
					aBackward.className="backward";
				}
			}
			if(details.pics.length<=5)
				aForward.className="forward disabled";
			/******鼠标进入小图片切换中图片和大图片*****/
			icon_list.onmouseover=function(e){
				var tar=e.target;
				if(tar.nodeName=="IMG"){
				  mImg.src=tar.dataset.md;
				  largeDiv.style.backgroundImage=
					`url(${tar.dataset.lg})`;
				}
			}
			/******鼠标进入中图片启动放大镜*****/
			var superMask=document.getElementById("superMask");
			var mask=document.getElementById("mask");
			superMask.onmouseover=function(){
				mask.style.display="block";
				largeDiv.style.display="block"
			}
			superMask.onmouseout=function(){
				mask.style.display="none";
				largeDiv.style.display="none";
			}
			var MSIZE=175;
			var SMSIZE=370;
			superMask.onmousemove=function(e){
				var x=e.offsetX,y=e.offsetY;
				var top=y-MSIZE/2;
				var left=x-MSIZE/2;
				if(top<0) top=0;
				else if(top>SMSIZE-MSIZE)
				top=SMSIZE-MSIZE;
				if(left<0) left=0;
				else if(left>SMSIZE-MSIZE)
				left=SMSIZE-MSIZE;
				mask.style.top=top+"px";
				mask.style.left=left+"px";
				largeDiv.style.backgroundPosition=-left*16/7+"px "+-top*16/7+"px";
			}
		})
	}
})()

$(function () {
  /**添加到收藏**/
  $("#collect").click(function (e) {
    e.preventDefault();
    location.href = "my_collect.html";
  })
  /**数量添加**/
  var n = $("#buy-num").val() * 1;
  $(".numberMinus").click(function () {
    if (n >= 1) {
      $("#buy-num").val(n -= 1);
    }
  })
  $(".numberAdd").click(function () {
    $("#buy-num").val(n += 1);
  })
})
//加入购物车操作
$("body").on('click', "#add_cart, #buy_now", function (e) {
  e.preventDefault();
  //获取购买数量
  var buyCount = $("#buy-num").val();
  $.ajax({
    type: 'POST',
    url: 'data/cart/add.php',
    data: {lid:location.search.split('=')[1], buyCount: buyCount},
    success: function(result){
		if(result.code===300){
			alert('您尚未登录！');
			location.href = 'login.html';
		}
		else if(result.code===200){
			alert('添加成功！');
			  location.href = 'cart.html';
		}
		else {
			alert('<b添加失败！</b><p>错误原因为：'+result.msg+'</p>');
		}
    }
 })
})