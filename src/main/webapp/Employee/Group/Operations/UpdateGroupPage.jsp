<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 04/02/2017
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <title>Update Group Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\main_css\main_styles.css">
</head>

<body class = "backgroundImageEmployee">

<div class = "pageTitleText pageTitleTextEmployee">
    Update Group Page (<c:out value="${requestScope.department.getLongName()}"/>)
</div>
<br />

<c:if test = "${requestScope.selected ne 'yes'}">
    <div class = "pageTitleText pageTitleTextEmployee">
        Select Group to update:
    </div>

    <div class = "pageContent pageContentEmployeePages pageContentAdminPages500px">
        <jsp:useBean id="departments" scope="request" type="java.util.List"/>
        <c:forEach items="${departments}" var="department">
            <div class = "textLabelParagraph textLabelEmployeePage"><c:out value="${department.getLongName()}"/></div>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #1</div>
            <c:forEach items="${department.getGroups1()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #2</div>
            <c:forEach items="${department.getGroups2()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #3</div>
            <c:forEach items="${department.getGroups3()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #4</div>
            <c:forEach items="${department.getGroups4()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #5</div>
            <c:forEach items="${department.getGroups5()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
            <div class = "textLabelParagraph textLabelEmployeePage">Course #6</div>
            <c:forEach items="${department.getGroups6()}" var="group">
                <div>
                    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
        </c:forEach>
    </div>

</c:if>

<c:if test = "${requestScope.selected eq 'yes'}">
    <div class = "pageTitleText pageTitleTextEmployee">
        Please fill form:
    </div>

    <div class = "pageContent pageContentEmployeePages pageContentEmployeePages300px">
        <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post" accept-charset="UTF-8">
            <input type="hidden"  name="step" value="step2">
            <input type="hidden"  name="groupID" value="${requestScope.group.getID()}" >
            <table>
                <tr>
                    <td class = "textLabel textLabelEmployeePage">Group name:</td>
                    <td>
                        <label>
                            <input class="inputSettings inputEmployee inputAdminPageLongNames" type="text"
                                   name="fullGroupName" maxlength="30" value="${requestScope.group.getFullGroupName()}" required/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class = "textLabel textLabelEmployeePage">Course Number:</td>
                    <td>
                        <label>
                            <input class="inputSettings inputEmployee numericInput2" type="number" name="courseNumber"
                                   maxlength="1" value="${requestScope.group.getCourseNumber()}" required/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan=2>
                        <button class="controlButton controlButtonEmployeePage">Update</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</c:if>

<div>
    <form action="${pageContext.request.contextPath}/Employee/UpdateGroupPageController" method="post">
        <input type="hidden"  name="step" value="cancel">
        <button class="controlButton controlButtonEmployeePage">Cancel</button>
    </form>
</div>

</body>
</html>
