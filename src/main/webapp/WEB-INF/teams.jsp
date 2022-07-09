<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 9:42 AM
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
    <h2>All Teams <span>
        | <a class="btn btn-sm btn-secondary" href="/teams/new">Add a New Team</a>
        | <a class="btn btn-sm btn-secondary" href="/dashboard">Return To Dashboard</a></span></h2>
    </h2>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>Team Name</th>
            <th>League</th>
            <th>Ballpark</th>
            <th>City, State</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ allTeams }" var="team">
            <tr>
                <td>
                    <a href= "/teams/${ team.id }">${ team.fullTeamName() } (${ team.teamInitials })</a>
                        </td>
                <td>
                    <c:choose>
                        <c:when test="${ team.league == false }">
                            American League
                        </c:when>
                        <c:otherwise>
                            National League
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${ team.ballpark }</td>
                <td>${ team.city }, ${ team.state }</td>

            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
