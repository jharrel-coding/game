<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 7/8/2022
  Time: 9:40 AM
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
    <form:form action="/teams/${ team.id }/update" method="POST" modelAttribute="editTeam">
        <input type="hidden" name="_method" value="put">

        <div class="row">
        <form:label path="teamName" class="form-label">Team Name</form:label>
        <form:input path="teamName" class="form-control" value="${ team.teamName }" type = "text"/>
        <form:errors path="teamName" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="teamInitials" class="form-label">Team Initials</form:label>
        <form:input path="teamInitials" class="form-control" value="${ team.teamInitials }" type = "text"/>
        <form:errors path="teamInitials" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="ballpark" class="form-label">Ballpark</form:label>
        <form:input path="ballpark" class="form-control" value="${ team.ballpark }" type = "text"/>
        <form:errors path="ballpark" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="city" class="form-label">City</form:label>
        <form:input path="city" class="form-control" value="${ team.city }" type = "text"/>
        <form:errors path="city" class="text-danger" />
    </div>
    <div class="row">
        <form:label path="state" class="form-label">State</form:label>
        <form:input path="state" class="form-control" value="${ team.state }" type = "text"/>
        <form:errors path="state" class="text-danger" />
    </div>


    <input class = "btn btn-primary" type="submit" value="Update Team" />
</div>



</form:form>


</div>

</body>
</html>
