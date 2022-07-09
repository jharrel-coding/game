<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 9:13 AM
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
    <form:form action="/games/${ game.id }/update" method="POST" modelAttribute="editGame">
        <input type="hidden" name="_method" value="put">
    <div class="row">
        <form:label path="gameDate" class="form-label">Game Date</form:label>
        <form:input path="gameDate" class="form-control" value="${ game.gameDate }" type = "date"/>
        <form:errors path="gameDate" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="homeTeam" class="form-label">Home Team</form:label>
        <form:input path="homeTeam" class="form-control" value="${ game.homeTeam }" type = "text"/>
        <form:errors path="homeTeam" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="awayTeam" class="form-label">Away Team</form:label>
        <form:input path="awayTeam" class="form-control" value="${ game.awayTeam }" type = "text"/>
        <form:errors path="awayTeam" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="ballpark" class="form-label">Ballpark</form:label>
        <form:input path="ballpark" class="form-control" value="${ game.ballpark }" type = "text"/>
        <form:errors path="ballpark" class="text-danger" />
    </div>


    <input class = "btn btn-primary" type="submit" value="Update Game" />
</div>



</form:form>


</div>

</body>
</html>
