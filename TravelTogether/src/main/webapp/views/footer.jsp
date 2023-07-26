<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/reset.css" media="all">
<link rel="stylesheet" href="${path}/resources/css/footer.css?ss">
<script src="https://kit.fontawesome.com/4d0517937c.js" crossorigin="anonymous"></script>
</head>
<body>
	<footer>
        <div class="footer__info">
            <div class="footer__logo">
                <a href="${path}/main">🚆<span>T</span>ravel <span>T</span>ogether</a>
            </div>
            <p class="companyinfo">
                주식회사 트래블투게더 | 서울 마포구 신촌로 176 | info@TravelTogether.com<br>
            </p>
            <p class="copyright">    
                Copyright &copy; TravelTogether inc. All Rights Reserved.
            </p>
        </div>
        <div class="footer__github">
            <ul>
                <li><a href="https://github.com/kimchoyool" ><i class="fa-brands fa-github fa-lg"></i> kimchoyool</a></li>
                <li><a href="https://github.com/jongkwon5" ><i class="fa-brands fa-github fa-lg"></i> jongkwon5</a></li>
                <li><a href="https://github.com/Hoonyyyy" ><i class="fa-brands fa-github fa-lg"></i> Hoonyyyy</a></li>
                <li><a href="https://github.com/RaspberryIcecream" ><i class="fa-brands fa-github fa-lg"></i> RaspberryIcecream</a></li>
                <li><a href="https://github.com/Kim-Byungju" ><i class="fa-brands fa-github fa-lg"></i> Kim-Byungju</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>