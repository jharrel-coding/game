<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- for validations -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <!-- YOUR own local CSS -->
    <link rel="stylesheet" href="/css/style.css"/>
    <!-- For any Bootstrap that uses JS or jQuery-->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>

    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container">
    <h1>No. ${ player.jerseyNumber } | ${ player.firstName } ${ player.lastName }</h1>

    <h4>Hits:
        <c:choose>
            <c:when test="${ player.hittingHand == true }">
                Right
            </c:when>
            <c:otherwise>
                Left
            </c:otherwise>
        </c:choose>

        /
        Throws:
        <c:choose>
            <c:when test="${ player.throwingHand == true }">
                Right
            </c:when>
            <c:otherwise>
                Left
            </c:otherwise>
        </c:choose>
    </h4>

</div>
</body>
</html>
