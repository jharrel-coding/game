<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 10:02 AM
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
    <div class="row align-items-start">
        <div class="col">
            <h2>All Teams <span> | <a class="btn btn-sm btn-secondary" href="/teams/new">Add a New Team</a></span></h2></h2>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>Team Name</th>
                    <th>Ballpark</th>
                    <th>City, State</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ allTeams }" var="team">
                    <tr>
                        <td>
                            <a href="/teams/${ team.id }">${ team.teamName } (${ team.teamInitials })</a>
                        </td>
                        <td>${ team.ballpark }</td>
                        <td>${ team.city }, ${ team.state }</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="col">
            <h2>All Players <span> | <a class="btn btn-sm btn-secondary" href="/players/new">Add a New Player</a></span></h2></h2>
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
    </div>
    <hr>
    <section>
        <div class="col">
            <h2>All Games <span> | <a class="btn btn-sm btn-secondary" href="/games/new">Add a New Game</a></span></h2>

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
                                    pattern="EEE, MMMM dd"
                                    value="${ game.gameDate }"
                            />
                        </td>
                        <td>${ game.homeTeam }</td>
                        <td>${ game.awayTeam }</td>
                        <td>${ game.ballpark }</td>

                        <td><a class="btn btn-secondary" href= "/games/${ game.id }">View</a></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </section>
</div>


</body>
</html>
