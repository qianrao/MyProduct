//加载header
(()=>{
	ajax("get","header.html","","text")
		.then(html=>{
			document.getElementById("header").innerHTML=html;
	})
})();



(()=>{	
	$("#header").load("header.html",()=>{
		var $login=$("#listLogin"),
			$welcome=$("#listWelcome");
		$.get("data/isLogin.php")
			.then(data=>{
				if(data.ok){
					$("#uname").text(data.uname);
					console.log($("#uname"));
					$welcome.show();
					$login.hide();
				}
				else{
					$welcome.hide();
					$login.show();
				}
		});
		$welcome.find("a").last().click(()=>{
		  $.get("data/logout.php")
			.then(()=>location.reload());
		});
	})

//为当前窗口添加滚动事件监听
window.addEventListener("scroll",()=>{
	//(防止和页面内容中的其它滚动事件冲突)
	//获得滚动高度:
		var scrollTop=
			document.body.scrollTop
			||
			document.documentElement.scrollTop;
		//如果滚动高度>=300
		if(scrollTop>=300){
			//设置id为header下的class为main
			document.querySelector("#header-top").className="clear fixed_nav";
		}else{//否则
			//设置id为header下的class为main
			document.querySelector("#header-top").className="clear";
		}
	})
})();




/**头部搜索按钮**/
$('body').on('click', '#search', function(){
    var kw = $('.input-kw').val();
    var loc = 'products.html';
    if(kw){
        loc += '?kw='+kw;
    }
    location.href = loc;
})


  
