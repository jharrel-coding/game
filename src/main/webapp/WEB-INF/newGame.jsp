<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 9:10 AM
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
    <form:form action="/games/create" method="POST" modelAttribute="newGame">

        <div class="row">
            <form:label path="gameDate" class="form-label">Game Date</form:label>
            <form:input path="gameDate" type="date" class="form-control date"  />
            <form:errors path="gameDate" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="homeTeam" class="form-label">Home Team</form:label>
            <form:select path="homeTeam">
                <c:forEach var = "team" items = "${ allTeams }">
                    <option value="${ team.teamName }">${team.teamName }</option>
                </c:forEach>
            </form:select>
            <form:errors path="homeTeam" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="homePitcher" class="form-label">Home Starting Pitcher</form:label>
            <form:select path="homePitcher">
                <c:forEach var = "player" items = "${ allPlayers }">
                    <option value="${player.fullName() }, ${player.playerPosition}">${player.fullName() }, ${player.playerPosition}</option>
                </c:forEach>
            </form:select>
            <form:errors path="homePitcher" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="awayTeam" class="form-label">Away Team</form:label>
            <form:select path="awayTeam">
                <c:forEach var = "team" items = "${ allTeams }">
                    <option value="${ team.teamName }">${team.teamName }</option>
                </c:forEach>
            </form:select>
            <form:errors path="awayTeam" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="awayPitcher" class="form-label">Visiting Starting Pitcher</form:label>
            <form:select path="awayPitcher">
                <c:forEach var = "player" items = "${ allPlayers }">
                    <option value="${player.fullName() }, ${player.playerPosition}">${player.fullName() }, ${player.playerPosition}</option>
                </c:forEach>
            </form:select>
            <form:errors path="awayTeam" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="ballpark" class="form-label">Ballpark</form:label>
            <form:select path="ballpark">
                <c:forEach var = "team" items = "${ allTeams }">
                    <option value="${ team.ballpark }">${team.ballpark }</option>
                </c:forEach>
            </form:select>
            <form:errors path="ballpark" class="text-danger" />
        </div>


            <input class = "btn btn-primary" type="submit" value="Create Game" />
        </div>



    </form:form>


</div>

</body>
</html>
