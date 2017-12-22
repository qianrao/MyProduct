function pageLoad(pno=0){
	//读取URL中的关键词？kw=xxxxx
	var kw=location.search.split("=")[1] || "";
	//ajax请求服务器端查询包含关键词的商品
	ajax(
		"get",
		"data/products.php?kw="+kw+"&pno="+pno,
		""
	).then(output=>{
		var data=output.data;
		console.log(data);
		var html="";
		for(var p of data){
        html+=
          `<li id="${p.lid}">
            <a href="product-details.html?lid=${p.lid}" title="${p.title}">
              <img src="${p.md}" >
            </a>
            <p>
              <span class="price">¥${p.price}</span>
              <a href="product-details.html?lid=${p.lid}">
                ${p.title}
              </a>
            </p>
            <div>
              <span class="reduce">-</span>
              <input type="text" value="1">
              <span class="add">+</span>
              <a href="javascript:;" data-lid="${p.lid}" class="addCart">加入购物车</a>
            </div>
          </li>`
		}
		var ulShowList=
			document.getElementById("show-list")
			ulShowList.innerHTML=html;
		//+ -变化
		//查找#show-list下的class为reduce和class为add的元素
		var spans=ulShowList.querySelectorAll(".reduce,.add");
		for(var span of spans){
			span.onclick=function(){
				//this->span
				var input=this.parentNode.children[1];
				var n=parseInt(input.value);
				if(this.className=="add") n++;
				else if(n>1) n--;
					input.value=n;
			}
		}

		//加入购物车
		$("#show-list").on("click",".addCart",function(e){
			e.preventDefault();
			if($("#listLogin").is(":visible")){
				alert("请先登录!");
				location.href = 'login.html';
			}else{
				var $this=$(this);
				var lid=$this.data("lid");
				var count=$this.prev().prev().val();
				$.post(
					"data/cart/add.php",
					//{lid,count}
					{lid:lid,count:count}
				).then(()=>{
					alert("添加成功！");
				});
			}
		});
		var $cart=$("#cart>.cart_content");
		function loadCart(){
			$.get("data/cart/list.php")
				.then(data=>{
					console.log(data);
					var html="";
					var total=0;
					for(var item of data){
						html+=`
							<div id="${item.iid}">
								<span>${item.title}</span>
								<div>
									<span class="reduce">-</span>
									<input type="text" value="${item.count}"/>
									<span class="add">+</span>
								</div>
								<span class="price">¥${(item.price*item.count).toFixed(2)}</span>
							</div>`;
						total+=item.price*item.count;
					}
					$cart.html(html);
					$("#total").html(total.toFixed(2));
					$cart.on(
						"click",".reduce,.add",function(){
							var $this=$(this);
							var iid=$this.parent().parent().attr("id"),
								count=$this.siblings("input").val();
							if($this.is(".add"))
								count++;
							else if(count>1)
								count--;
							$.post(
								"data/cart/update.php",
								{iid,count}
							).then(loadCart);
						})
					})
			}
		loadCart();

		//分页
		var pageCount=output.pageCount,
			pageNo=output.pageNo;
		var lis="";
		for(var i=0;i<pageCount;i++){
		  lis+=(i!=pageNo?`<a href="#">${i+1}</a>`:
			`<a href="javascript:;" class="current">${i+1}</a>`);
		}
		var html=
		  `<a href="javascript:;" class="previous">上一页</a>${
			lis
		  }<a href="javascript:;" class="next">下一页</a>`;
		var divPages=document.getElementById("pages");
		divPages.innerHTML=html;
		if(pageNo==0){
		  divPages.firstElementChild.className=
			"previous disabled";
		}else if(pageNo==pageCount-1){
		  divPages.lastElementChild.className=
			"next disabled";
		}else{
		  divPages.firstElementChild.className=
			"previous";
		  divPages.lastElementChild.className=
			"next";
		}

		//作业: 改为利用冒泡
		//只要多个子元素绑定相同的事件，都要把事件绑在父元素上一份即可
		var as=divPages.querySelectorAll(":not(.previous):not(.next)");
		console.log(as);
		for(var i=0;i<as.length;i++){
			as[i].onclick=function(){
				pageLoad(this.innerHTML-1);
			}
		}
		divPages.firstElementChild.onclick=
			divPages.lastElementChild.onclick=function(){
			if(this.className.indexOf("disabled")==-1){
				var curr=
					divPages.querySelector(".current");
				if(this==divPages.children[0])
					pageLoad(curr.innerHTML-2);
				else pageLoad(curr.innerHTML);
			}
		}
	  })
	}
	pageLoad();

/**附加导航滚动监听**/
$(function () {
  $(window).scroll(function () {
    if ($(document).scrollTop() >= 350) {
      $('.store_action_right_cart').css({position: 'fixed', top: '400px'});
    } else {
      $('.store_action_right_cart').css({position: 'absolute', top: '800px'});
    }
  })
})


