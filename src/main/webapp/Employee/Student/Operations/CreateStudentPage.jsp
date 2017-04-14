<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alex
  Date: 16/02/2017
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Student Page</title>
    <link rel="stylesheet" type="text/css" href="main_css\main_styles.css">
</head>
<body class = "backgroungImageEmployee">

<div class = "pageTitleText pageTitleTextEmployee">
    Create Student Page (<c:out value="${department.getLongName()}"/>)
</div>
<br />

<c:if test = "${selected ne 'yes'}">
    <div class = "pageTitleText pageTitleTextEmployee">
        Select Group to add student:
    </div>

    <div class = "pageContent pageContentEmployeePages pageContentAdminPages500px">
            <div class = "textLabelParagraph textLabelEmployeePage"><c:out value="${department.getLongName()}"/></div>

            <div class = "textLabelParagraph textLabelEmployeePage">Course 1:</div>
            <c:forEach items="${department.getGroups1()}" var="group">
                <div>
                    <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                        <input type="hidden"  name="step" value="step1">
                        <input type="hidden"  name="groupID" value="${group.getID()}">
                        <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                    </form>
                </div>
            </c:forEach>
        <div class = "textLabelParagraph textLabelEmployeePage">Course 2:</div>
        <c:forEach items="${department.getGroups2()}" var="group">
            <div>
                <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="groupID" value="${group.getID()}">
                    <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                </form>
            </div>
        </c:forEach>
        <div class = "textLabelParagraph textLabelEmployeePage">Course 3:</div>
        <c:forEach items="${department.getGroups3()}" var="group">
            <div>
                <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="groupID" value="${group.getID()}">
                    <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                </form>
            </div>
        </c:forEach>
        <div class = "textLabelParagraph textLabelEmployeePage">Course 4:</div>
        <c:forEach items="${department.getGroups4()}" var="group">
            <div>
                <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="groupID" value="${group.getID()}">
                    <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                </form>
            </div>
        </c:forEach>
        <div class = "textLabelParagraph textLabelEmployeePage">Course 5:</div>
        <c:forEach items="${department.getGroups5()}" var="group">
            <div>
                <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="groupID" value="${group.getID()}">
                    <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                </form>
            </div>
        </c:forEach>
        <div class = "textLabelParagraph textLabelEmployeePage">Course 6:</div>
        <c:forEach items="${department.getGroups6()}" var="group">
            <div>
                <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                    <input type="hidden"  name="step" value="step1">
                    <input type="hidden"  name="groupID" value="${group.getID()}">
                    <button onclick="submit" class="itemButton itemButtonEmployeePages" ><c:out value="${group.getFullGroupName()}"/></button>
                </form>
            </div>
        </c:forEach>
    </div>

</c:if>

<c:if test = "${selected eq 'yes'}">
    <div class = "pageContent pageContentEmployeePages pageContentAdminPages500px">
        <div class = "textLabelParagraph textLabelEmployeePage">
            Please fill form:
        </div>

        <div>
            <form action="CreateStudentPageController" method="post" accept-charset="UTF-8">
                <table>
                    <input type="hidden"  name="step" value="step2">
                    <input type="hidden"  name="groupID" value="${groupID}">
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Name:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="text" name="name" maxlength="40" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Surname:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="text" name="lastName" maxlength="50" required/>
                        </td>
                    </tr>
                    <tr >
                        <td class = "textLabel textLabelEmployeePage">Middle Name:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="text" name="fathersName" maxlength="40" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Identification code:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="number" name="personalID" maxlength="10" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Sex:</td>
                        <td class ="textLabel textLabelEmployeePage">
                            <input type="radio" name="sex" value="m" checked>Male<br>
                            <input type="radio" name="sex" value="f">Female
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Date of birth:</td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Day</td>
                        <td>
                            <input class = "inputSettings inputEmployee numericInput2" type="number" name="bday" maxlength="2" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">   Month</td>
                        <td>
                            <input class = "inputSettings inputEmployee numericInput2" type="number" name="bmonth" maxlength="2" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">   Year</td>
                        <td>
                            <input class = "inputSettings inputEmployee numericInput4" type="number" name="byear" maxlength="4" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Email:</td>
                        <td>
                            <input class = "inputSettings inputEmployee inputAdminPageLongNames" type="text" name="email" maxlength="100" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Phone Number:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="text" name="phoneNumber" maxlength="20" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Address:</td>
                        <td>
                            <input class = "inputSettings inputEmployee inputAdminPageLongNames" type="text" name="address" maxlength="200" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Passport data:</td>
                        <td>
                            <input class = "inputSettings inputEmployee inputAdminPageLongNames" type="text" name="pasport" maxlength="200" required/>
                        </td>
                    </tr>
                    <tr>
                        <td class = "textLabel textLabelEmployeePage">Students book:</td>
                        <td>
                            <input class = "inputSettings inputEmployee" type="text" name="indexBook" maxlength="100" required/>
                        </td>
                    </tr>

                    <tr>
                        <td class = "textLabel textLabelEmployeePage">LogIn:</td>
                        <td>
                            <input class = "inputSettings inputEmployee inputAdminPageLongNames" type="text" name="login" maxlength="70" required/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan=2>
                            <button onclick="submit"  class="controlButton controlButtonEmployeePage">Create</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</c:if>

<div>
    <form action="CreateStudentPageController" method="post">
        <input type="hidden"  name="step" value="cancel">
        <td colspan=2>
            <button onclick="submit"  class="controlButton controlButtonEmployeePage">Cancel</button>
        </td>
    </form>
</div>

</body>
</html>
