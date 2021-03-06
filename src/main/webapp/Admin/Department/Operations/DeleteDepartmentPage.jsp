<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 12/12/2016
  Time: 08:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\main_css\main_styles.css">
    <title>Delete Department Page</title>
</head>

<body class = "backgroundImageAdmin">

<div class = "pageTitleText pageTitleTextAdmin">
    Delete Department Page
</div>
<br />

<c:if test = "${requestScope.step eq 'step0'}">
    <div class = "pageTitleText pageTitleTextAdmin">
        Select Institute where to Delete Department:
    </div>

    <div class = "pageContent pageContentAdminPages pageContentAdminPages500px">
        <jsp:useBean id="institutesList" scope="request" type="java.util.List"/>
        <c:forEach items="${institutesList}" var="institute">
            <div>
                <form action="${pageContext.request.contextPath}/Admin/DeleteDepartmentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="instituteID" value="${institute.getID()}">
                    <button class="itemButton itemButtonAdminPages" ><c:out value="${institute.getLongName()}"/></button>
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>

<c:if test = "${requestScope.step eq 'step1'}">
    <div class = "pageTitleText pageTitleTextAdmin">
        Select Faculty where to Delete Department:
    </div>

    <div class = "pageContent pageContentAdminPages pageContentAdminPages500px">
        <jsp:useBean id="facultiesList" scope="request" type="java.util.List"/>
        <c:forEach items="${facultiesList}" var="faculty">
            <div>
                <form action="${pageContext.request.contextPath}/Admin/DeleteDepartmentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step2">
                    <input type="hidden"  name="facultyID" value="${faculty.getID()}">
                    <button class="itemButton itemButtonAdminPages" ><c:out value="${faculty.getLongName()}"/></button>
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>

<c:if test = "${requestScope.step eq 'step2'}">
    <div class = "pageTitleText pageTitleTextAdmin">
        Select Department to Delete:
    </div>

    <div class = "pageContent pageContentAdminPages pageContentAdminPages500px">
        <jsp:useBean id="departmentsList" scope="request" type="java.util.List"/>
        <c:forEach items="${departmentsList}" var="department">
            <div>
                <form action="${pageContext.request.contextPath}/Admin/DeleteDepartmentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step3">
                    <input type="hidden"  name="departmentID" value="${department.getID()}">
                    <button class="itemButton itemButtonAdminPages" ><c:out value="${department.getLongName()}"/></button>
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>

<c:if test = "${requestScope.step eq 'step3'}">
    <div class = "pageContent pageContentAdminPages pageContentAdminPagesTwoFieldsSize">
        <c:if test = "${requestScope.possible_to_remove eq 'yes'}">
            <div class = "textLabelParagraph textLabelAdminPage">
                Please Confirm Delete: <c:out value="${requestScope.department.getLongName()}"/>
            </div>

            <div>
                <form action="${pageContext.request.contextPath}/Admin/DeleteDepartmentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step4">
                    <input type="hidden"  name="departmentID" value="${requestScope.department.getID()}" >
                    <table>
                        <tr>
                            <td colspan=2>
                                <button class="controlButton controlButtonAdminPage">Delete</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </c:if>
        <c:if test = "${requestScope.possible_to_remove eq 'no'}">
            <div class = "pageTitleText  pageTitleTextBad">
                Impossible to Delete: <c:out value="${requestScope.department.getLongName()}"/> , there is still some date present!
            </div>
        </c:if>
    </div>
</c:if>

<div>
    <form action="${pageContext.request.contextPath}/Admin/DeleteDepartmentPageController" method="post">
        <input type="hidden"  name="step" value="cancel">
        <button class="controlButton controlButtonAdminPage">Cancel</button>
    </form>
</div>

</body>
</html>
