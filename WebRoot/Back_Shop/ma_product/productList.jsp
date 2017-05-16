<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" type="text/css" href="/Horizon/Back_Shop/css/productList.css" />
<link rel="stylesheet" type="text/css" href="/Horizon/pager/pager.css" />
<script type="text/javascript" src="/Horizon/pager/pager.js"></script>
<script type="text/javascript" src="/Horizon/Back_Shop/js/productList.js"></script>
  </head>
  
  <body>
<div class="divBook">
<ul>


<c:forEach items="${pb.beanList }" var="product">
 <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/admin/AdminProServlet?method=load&bid=${product.bid }'/>"><img src="<c:url value='/${product.image_b }'/>" border="0"/></a>
    <p class="price" >
		<span class="price_n">&yen;${product.currPrice }</span>
		<span class="price_r">&yen;${product.price }</span>
		(<span class="price_s">${product.discount }折</span>)
	</p>
	<c:url value="/admin/AdminProServlet" var="authorUrl">
		<c:param name="method" value="findByAuthor"/>
		<c:param name="author" value="${product.author }"/>
	</c:url>
	<c:url value="/admin/AdminProServlet" var="pressUrl">
		<c:param name="method" value="findByPress"/>
		<c:param name="press" value="${product.press }"/>
	</c:url>
	<p><a id="bookname" title="${product.bname }" href="<c:url value='/admin/AdminProServlet?method=load&bid=${product.bid }'/>">${product.bname }</a></p>
	<p><a href="${authorUrl }" name='P_zz' title='${product.author }'>${product.author }</a></p>
	<p class="publishing">
		<span>店铺：</span><a href="${pressUrl }">${product.press }</a>
	</p>
  </div>
 </li>
</c:forEach>

</ul>
</div>
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/pager/pager.jsp" %>
</div>
  </body>
 
</html>
