
function getTotalTop(elem){
  var sum=0;
  do{
    sum+=elem.offsetTop;
    elem=elem.offsetParent;
  }while(elem);
  return sum;
}
//加载轮播图
//加载广告轮播
(()=>{
  ajax("get","data/banners.php","")
    .then(data=>{
    const LIWIDTH=1920;
    var htmlImgs="";//保存图片li的HTML片段
    //for(var i=0;i<data.length;i++){
      //var p=data[i];
    data.push(data[0]);
    for(var p of data){
      htmlImgs+=`<li>
              <a href="${p.href}" title="${p.title}">
                <img src="${p.img}">
              </a>
            </li> `;
    }
    var bannerImg=
      document.getElementById("banner-img");
    bannerImg.style.width=LIWIDTH*data.length+"px";
    bannerImg.innerHTML=htmlImgs;
    document.getElementById("indicators")
            .innerHTML="<li></li>".repeat(data.length-1);
    $("#indicators>li:first").addClass("hover");

    var i=0,wait=3000,timer=null;
        $banner=$(bannerImg);
    function move(){
      timer=setTimeout(()=>{
        if(i<data.length-1){
          i++;
          $banner.css("left",-LIWIDTH*i);
          if(i<data.length-1)
            $("#indicators>li:eq("+i+")")
              .addClass("hover")
              .siblings().removeClass("hover");
          else
            $("#indicators>li:eq("+0+")")
            .addClass("hover")
            .siblings().removeClass("hover");
          move();
        }else{
          $(bannerImg).css("transition","")
          $banner.css("left",0);
          setTimeout(()=>{
            $(bannerImg)
              .css(
              "transition","all .3s linear");
            i=1;
            $banner.css("left",-LIWIDTH*i);
            $("#indicators>li:eq("+i+")")
            .addClass("hover")
            .siblings().removeClass("hover");
          },50);
          $("#indicators>li:eq("+i+")")
            .addClass("hover")
            .siblings().removeClass("hover");
          move();
        }

      },3000);
    }
    move();
    $("#banner").hover(
      ()=>clearTimeout(timer),
      ()=>move()
    );
    $("#indicators")
      .on("mouseover","li",function(){
      var $this=$(this);
      if(!$this.hasClass("hover")){
        i=$this.index();
        $banner.css("left",-LIWIDTH*i);
        $("#indicators>li:eq("+i+")")
              .addClass("hover")
              .siblings().removeClass("hover");
      }
    })
  })
})();


$(function () {
  $.ajax({
    url: 'data/index.php',
    success: function (data) {
		//2.加载“首页推荐”
		  var html = `
				<div>
				  <div class="desc">
					<p class="name">${data.recommendedItems[0].title}</p>
					<p class="details">${data.recommendedItems[0].details}</p>
					<p class="price">￥${data.recommendedItems[0].price}</p>
					<a href="${data.recommendedItems[0].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.recommendedItems[0].pic}">
				</div>
				<div>
				  <img src="${data.recommendedItems[1].pic}">
				  <div class="desc">
					<p class="name">${data.recommendedItems[1].title}</p>
					<p class="details">${data.recommendedItems[1].details}</p>
					<p class="price">￥${data.recommendedItems[1].price}</p>
					<a href="${data.recommendedItems[1].href}" class="view">查看详情</a>
				  </div>
				</div>
				<div>
				  <div class="desc">
					<p class="name">${data.recommendedItems[2].title}</p>
					<p class="price">￥${data.recommendedItems[2].price}</p>
					<a href="${data.recommendedItems[2].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.recommendedItems[2].pic}">
				</div>
				<div class="product ">
				  <img src="${data.recommendedItems[3].pic}" alt=""/>
				  <h2>${data.recommendedItems[3].title}</h2>
				  <p>￥${data.recommendedItems[3].price}</p>
				  <a href="${data.recommendedItems[3].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.recommendedItems[4].pic}" alt=""/>
				  <h2>${data.recommendedItems[4].title}</h2>
				  <p>￥${data.recommendedItems[4].price}</p>
				  <a href="${data.recommendedItems[4].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.recommendedItems[5].pic}" alt=""/>
				  <h2>${data.recommendedItems[5].title}</h2>
				  <p>￥${data.recommendedItems[5].price}</p>
				  <a href="${data.recommendedItems[5].href}">查看详情</a>
				</div>
				`;
		  $('#f1 .floor_content').html(html);

		   //2.加载“最新上架 /F2”
		  var html = `
				<div>
				  <div class="desc">
					<p class="name">${data.newArrivalItems[0].title}</p>
					<p class="details">${data.newArrivalItems[0].details}</p>
					<p class="price">￥${data.newArrivalItems[0].price}</p>
					<a href="${data.newArrivalItems[0].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.newArrivalItems[0].pic}">
				</div>
				<div>
				  <img src="${data.newArrivalItems[1].pic}">
				  <div class="desc">
					<p class="name">${data.newArrivalItems[1].title}</p>
					<p class="details">${data.newArrivalItems[1].details}</p>
					<p class="price">￥${data.newArrivalItems[1].price}</p>
					<a href="${data.newArrivalItems[1].href}" class="view">查看详情</a>
				  </div>
				</div>
				<div>
				  <div class="desc">
					<p class="name">${data.newArrivalItems[2].title}</p>
					<p class="price">￥${data.newArrivalItems[2].price}</p>
					<a href="${data.newArrivalItems[2].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.newArrivalItems[2].pic}">
				</div>
				<div class="product ">
				  <img src="${data.newArrivalItems[3].pic}" alt=""/>
				  <h2>${data.newArrivalItems[3].title}</h2>
				  <p>￥${data.newArrivalItems[3].price}</p>
				  <a href="${data.newArrivalItems[3].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.newArrivalItems[4].pic}" alt=""/>
				  <h2>${data.newArrivalItems[4].title}</h2>
				  <p>￥${data.newArrivalItems[4].price}</p>
				  <a href="${data.newArrivalItems[4].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.newArrivalItems[5].pic}" alt=""/>
				  <h2>${data.newArrivalItems[5].title}</h2>
				  <p>￥${data.newArrivalItems[5].price}</p>
				  <a href="${data.newArrivalItems[5].href}">查看详情</a>
				</div>
				`;
		  $('#f2 .floor_content').html(html);

		  //2.加载“热卖单品 /F3”
		  var html = `
				<div>
				  <div class="desc">
					<p class="name">${data.topSaleItems[0].title}</p>
					<p class="details">${data.topSaleItems[0].details}</p>
					<p class="price">￥${data.topSaleItems[0].price}</p>
					<a href="${data.topSaleItems[0].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.topSaleItems[0].pic}">
				</div>
				<div>
				  <img src="${data.topSaleItems[1].pic}">
				  <div class="desc">
					<p class="name">${data.topSaleItems[1].title}</p>
					<p class="details">${data.topSaleItems[1].details}</p>
					<p class="price">￥${data.topSaleItems[1].price}</p>
					<a href="${data.topSaleItems[1].href}" class="view">查看详情</a>
				  </div>
				</div>
				<div>
				  <div class="desc">
					<p class="name">${data.topSaleItems[2].title}</p>
					<p class="price">￥${data.topSaleItems[2].price}</p>
					<a href="${data.topSaleItems[2].href}" class="view">查看详情</a>
				  </div>
				  <img src="${data.topSaleItems[2].pic}">
				</div>
				<div class="product ">
				  <img src="${data.topSaleItems[3].pic}" alt=""/>
				  <h2>${data.topSaleItems[3].title}</h2>
				  <p>￥${data.topSaleItems[3].price}</p>
				  <a href="${data.topSaleItems[3].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.topSaleItems[4].pic}" alt=""/>
				  <h2>${data.topSaleItems[4].title}</h2>
				  <p>￥${data.topSaleItems[4].price}</p>
				  <a href="${data.topSaleItems[4].href}">查看详情</a>
				</div>
				<div class="product ">
				  <img src="${data.topSaleItems[5].pic}" alt=""/>
				  <h2>${data.topSaleItems[5].title}</h2>
				  <p>￥${data.topSaleItems[5].price}</p>
				  <a href="${data.topSaleItems[5].href}">查看详情</a>
				</div>
				`;
		  $('#f3 .floor_content').html(html);	
	}
  })
});




//楼层楼梯

(()=>{
  ajax("get","data/floors.php","")
    .then(output=>{

    //获得id为f1的元素距页面顶部的总距离totalTop
    var f1TotalTop=getTotalTop(//红
      document.getElementById("f1")
    );
    //查找id为lift的div保存在变量lift中
    var lift=document.getElementById("lift");
    //为window添加滚动事件监听
    window.addEventListener("scroll",()=>{
      //获得页面滚动的高度scrollTop
      var scrollTop=document.body.scrollTop
        ||document.documentElement.scrollTop;
      //如果totalTop<=scrollTop+innerHeight/2
        //让lift显示
      //否则,让lift隐藏
      lift.style.display=
        f1TotalTop<=scrollTop+innerHeight/2?
          "block":"none";
      //只有电梯按钮显示时，才用判断按钮的亮灭
      if(lift.style.display=="block"){
        //定义楼层高度变量FHEIGHT=888
        var FHEIGHT=900;
        //找到class为floor的每个楼层元素fs
        var fs=
          document.querySelectorAll(".floor");
        //遍历fs中每个楼层
        for(var i=0;i<fs.length;i++){
          //获得当前楼层距body顶部的总距离totalTop
          var totalTop=getTotalTop(fs[i]);
          //计算楼层亮灯区域的开始位置
          var start=totalTop-innerHeight/2;
          //计算结束位置end为start+FHEIGHT
          var end=start+FHEIGHT;
          //如果scrollTop>=start且scrollTop<end
          if(scrollTop>=start&&scrollTop<end)
            break;//就退出循环
        }
        //在lift下找到class为lift_item_on的li，将其class恢复为lift_item
        var currLi=
          lift.querySelector(".lift_item_on")
        if(currLi)
          currLi.className="lift_item";
        //设置lift下第i个li的class为lift_item_on
        lift.querySelector(
          `li:nth-child(${i+1})`
        ).className="lift_item_on";
      }
    });

    //在lift下找class为lift_list下的class为lift_item的所有a保存在as中
    var as=lift.querySelectorAll(
      ".lift_list .lift_item"
    );
    for(let i=0;i<as.length;i++){//遍历as
      //为每个as绑定单击事件
      as[i].onclick=function(){
        //查找id为fi的元素fi
        var fi=
          document.getElementById("f"+(i+1));
        //获得fi距body顶部的总距离totalTop
        var totalTop=getTotalTop(fi);
        //让window滚动到totalTop
        //window.scrollTo(0,totalTop-70);
        $("html,body").stop(true).animate({
          //非css标准属性，jquery中独有
          scrollTop:totalTop-200
        },1000);
      }
    }
  })
})();




