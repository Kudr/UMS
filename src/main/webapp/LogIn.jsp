<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="main_css\main_styles.css">
    <title>LOG IN PAGE</title>
</head>

<body class = "backgroungImageLogIn">

    <div class = "pageTitleText pageTitleTextLogIn">
            Welcome to Log In Page
    </div>
    <c:if test = "${!empty wrongPasswordOrLogIn}">
        <div class = "pageTitleText pageTitleTextBad">
                <c:if test = "${wrongPasswordOrLogIn eq 'absentInBase'}">
                    Incorrect LogIn or Password!
                </c:if>
                <c:if test = "${wrongPasswordOrLogIn eq 'wrongPassword'}">
                    Incorrect LogIn or Password!
                </c:if>
                <c:if test = "${wrongPasswordOrLogIn eq 'absentConnectionToDataBase'}">
                    Absent Data Base connection!
                </c:if>
                <c:if test = "${wrongPasswordOrLogIn eq 'errorInAccess'}">
                    Error in access. Please contact your administrator!
                </c:if>
                <c:if test = "${wrongPasswordOrLogIn eq 'notAuthorized'}">
                    Not authorized!
                </c:if>
        </div>
    </c:if>

    <form action="LogInServlet" method="post">
        <div class = "itemsBlock">
            <table>
                <tr>
                    <td class = "textLabel textLabelLogInPage">Login Name:</td>
                    <td>
                        <input class = "inputSettings inputLogInPage" name="username" type="text" maxlength="70" data-hint="insert log in" required/>
                    </td>
                </tr>
                <tr>
                    <td class = "textLabel textLabelLogInPage">Password:</td>
                    <td>
                        <input class = "inputSettings inputLogInPage" name="password" type="password" maxlength="70"
                               placeholder="" autocomplete="off" data-hint="insert password" required/>
                    </td>
                </tr>
                <br>
            </table>
            <tr>
                <td >
                    <button onclick="submit" value="Log In" class="controlButton controlButtonWLogInPage">Log In</button>
                    <br>
                </td>
            </tr>
        </div>
    </form>
</body>
</html>