<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 9:34 AM
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
    <section>
        <div class="container">
            <h1>${ team.teamName } (${ team.teamInitials})</h1>
            <p>ballpark: ${team.ballpark}</p>
            <p>${ team.city }, ${ team.state }</p>
        </div>
    </section>
    <hr>

    <section>
        <div class="container">
            <h2>All Players</h2>
            <a href="/players/new">Add a New Player</a>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Throws/Hits</th>
                    <th>Position</th>
                    <th>Team</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ allPlayers }" var="player">
                    <tr>
                        <td>${player.jerseyNumber }</td>
                        <td>
                            <a href= "/players/${ player.id }">${ player.fullName() }</a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${ player.hittingHand == true }">
                                    Right
                                </c:when>
                                <c:otherwise>
                                    Left
                                </c:otherwise>
                            </c:choose>

                            /

                            <c:choose>
                                <c:when test="${ player.throwingHand == true }">
                                    Right
                                </c:when>
                                <c:otherwise>
                                    Left
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>${player.playerPosition }</td>
                        <td>${player.team.teamName}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </section>

</body>
</html>