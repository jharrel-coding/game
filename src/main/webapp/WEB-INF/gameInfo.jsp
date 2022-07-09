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
        <div>
            <h1>${ game.homeTeam } vs ${ game.awayTeam}</h1>
            <h4>Ballpark: ${game.ballpark}</h4>
            <h4>Game Date: <fmt:formatDate
                    pattern="EEE, MMMM dd"
                    value="${ game.gameDate }"
            />
            </h4>
        </div>

        <div>
            <td>
                <a class="btn-primary btn" href="/games/${ game.id }/edit">Edit</a>
                |
                <a class="btn-primary btn" href="/dashboard">Return Home</a>
                <form action="/games/${ game.id }/destroy" method="POST">
                    <input type="hidden" name="_method" value="delete">

                    <input class="btn btn-danger" type="submit" value="Delete"/>
                </form>
            </td>
        </div>
    </div>
    </section>
</body>
</html>
