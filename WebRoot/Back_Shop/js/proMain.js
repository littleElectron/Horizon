/**
 * 获取并显示商品类别列表
 */
$(document).ready(function() {
	var num = 0;
	$.ajax({
		type: "get",
		url: "/Horizon/category_product/GetCategoryListCtrl",
		success: function(html) {
			$(".listContent").html(html);
			num = $("#getParNum").val() + 1;
			//列表项滑动样式
			for(var i=1; i<num; i++) {
				(function(){
					var index = i;
					$("#l1_"+i).click(function(){
						for(var i2=1; i2<num; i2++) {
							if(i2 == index) {
								$("#l2_"+i2).slideToggle(200);
							} else {
								$("#l2_"+i2).slideUp(200);
							}
						}
					});
				})();
			}
			//二级分类单击效果
			$(".listLayer2,this").click(function(){
				$(".listLayer2").css({"border-left-width": "1px"});
				$(this).css({"border-left-width": "7px"});
			});
		},
		error: function() {
			$(".listContent").html("<h3 align='center'><font color='white'>Error</font><h3>");
		}
	});
});

/**
 * 商品类别列表高度调整
 */
$(document).ready(function(){ 
	if($(".commodityArea").height()+70 > $(window).height()) {
		$(".list").height($(".commodityArea").height()+70);
	} else {
		if($(window).height() < 500){
			$(".list").height(500);
		} else {
			$(".list").height($(window).height());
		}
	}
	$(window).resize(function() {
		if($(".commodityArea").height() > $(window).height()) {
			$(".commodityArea").height($(".commodityArea").height()+70);
		} else {
			if($(window).height() < 500){
				$(".list").height(500);
			} else {
				$(".list").height($(window).height());
			}
		}
	});
});

/**
 * 显示商品区列表
 */
$(document).ready(function(){ 
	$.ajax({
		type: "get",
		url: "/Horizon/product/GetProductListCtrl?cid=%&currentPage=1",
		success: function(html) {
			$(".productList").html(html);
		},
		error: function() {
			$(".productList").html("<h2 align='center'><b>网页加载异常</b><h3>");
		}
	});
});

/**
 * 添加商品
 */
$(document).ready(function(){ 
	$(".newProduct").click(function() {
		$.ajax({
			type: "get",
			url: "/Horizon/Back_Shop/ma_product/addProduct.jsp",
			success: function(html) {
				$(".mainArea").html(html);
			},
			error: function() {
				$(".mainArea").html("<h2 align='center'><b>网页加载异常</b><h3>");
			}
		});
	});
});