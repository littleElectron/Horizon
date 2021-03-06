<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
<html>
	<script type="text/javascript">
		$(document).ready(function(){ 
			$(".listLayer2,this").click(function() {
				$.ajax({
					type: "get",
					url: "/Horizon/product/GetProductListCtrl?shopid=" + $(".shopID").val() + "&cid=" + $(this).attr("id") + "&currentPage=1",
					success: function(html) {
						$(".productList").html(html);
					},
					error: function() {
						$(".productList").html("<h2 align='center'><b>网页加载异常</b><h3>");
					}
				});
			});
		});
	</script>
	
	<ul>
	<c:forEach items="${parents }" var="parent">
	<c:set var="count" value="${count+1}"/>
		<li>
		  	<div id="l1_${count}" align="center" class="listLayer1">${parent.cname }</div>
		  	<div id="l2_${count}" style="display:none;" >
			<ul>
			<c:forEach items="${parent.children }" var="child">
				<li>
				  <div align="center" id="${child.cid }" class="listLayer2">${child.cname }</div>
				</li>
			</c:forEach>
			</ul>
			</div>
		</li>
	</c:forEach>
	</ul>
	<input type="hidden" id="getParNum" value="${count}">
</html>
