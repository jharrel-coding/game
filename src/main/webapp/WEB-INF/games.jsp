<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <h2>All Games <span>
        | <a class="btn btn-sm btn-secondary" href="/games/new">Add a New Game</a>
        | <a class="btn btn-sm btn-secondary" href="/dashboard">Return To Dashboard</a></span></h2>
    </h2>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>Game Date</th>
            <th>Home Team</th>
            <th>Away Team</th>
            <th>Ballpark</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ allGames }" var="game">
            <tr>
                <td>
                    <fmt:formatDate
                            pattern = "EEE, MMMM dd"
                            value = "${ game.gameDate }"
                    />
                </td>

                <td>${ game.homeTeam }</td>
                <td>${ game.awayTeam }</td>
                <td>${ game.ballpark }</td>

                <td><a href= "/games/${ game.id }">View</a> | <a href="/games/${ game.id }/edit">Edit</a> |
                    <form action="/games/${ game.id }/destroy" method = "POST">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="Delete" /></form>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
