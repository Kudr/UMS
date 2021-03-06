<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 30/01/2017
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Discipline Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\main_css\main_styles.css">
</head>

<body class = "backgroundImageEmployee">

<div class = "pageTitleText pageTitleTextEmployee">
    Welcome to Discipline Page
    <br />
    Please choose action:
</div>
<br />

<c:set var="step" value="${0}" scope="page"/>
<c:set var="action" value="none" scope="page"/>

<div class="itemsBlock">
    <div>
        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="create">
                <button class="topicButton topicButtonEmployeePage">Create Discipline</button>
            </form>
        </div>
        <br />

        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="update">
                <button class="topicButton topicButtonEmployeePage">Update  Discipline</button>
            </form>
        </div>
        <br />

        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="delete">
                <button class="topicButton topicButtonEmployeePage">Delete  Discipline</button>
            </form>
        </div>
        <br />

        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="setDependency">
                <button class="topicButton topicButtonEmployeePage">Set Discipline Dependency</button>
            </form>
        </div>
        <br />

        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="showInfo">
                <button class="topicButton topicButtonEmployeePage">Show Discipline Info</button>
            </form>
        </div>
        <br />

        <div>
            <form action="${pageContext.request.contextPath}/Employee/DisciplinePageController" method="post">
                <input type="hidden"  name="operationType" value="cancel">
                <button class="controlButton controlButtonEmployeePage">Cancel</button>
            </form>
        </div>
        <br />

    </div>
</div>
</body>
</html>
