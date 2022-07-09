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
    <form:form action="/players/${ player.id }/update" method="POST" modelAttribute="editPlayer">
        <input type="hidden" name="_method" value="put">
        <div class="row">
            <form:label path="jerseyNumber" class="form-label">#</form:label>
            <form:input path="jerseyNumber" class="form-control" value="${player.jerseyNumber }" type = "number"/>
            <form:errors path="jerseyNumber" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="firstName" class="form-label">First Name:</form:label>
            <form:input path="firstName" class="form-control" value="${player.firstName }" type = "text"/>
            <form:errors path="firstName" class="text-danger" />
        </div>
        <div class="row">
            <form:label path="lastName" class="form-label">Last Name</form:label>
            <form:input path="lastName" class="form-control" value="${player.lastName }" type = "text"/>
            <form:errors path="lastName" class="text-danger" />
        </div>

        <div class="row input-group">

            <form:label class="form-label" path="hittingHand">Hitting Hand</form:label>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" label="Right"
                                  path="hittingHand" value="true" />

            </div>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" path="hittingHand"
                                  label="Left" value="false" />
            </div>

            <form:label class="form-label" path="throwingHand">Hitting Hand</form:label>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" label="Right"
                                  path="throwingHand" value="true" />

            </div>
            <div class="input-group-text">
                <form:radiobutton class="form-check-input" path="throwingHand"
                                  label="Left" value="false" />
            </div>


            <input class = "btn btn-primary" type="submit" value="Submit" />
        </div>



    </form:form>


</div>

</body>
</html>
