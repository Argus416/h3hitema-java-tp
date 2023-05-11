<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Developpeur
  Date: 08/05/2023
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers</title>
    <link rel="stylesheet" href="<c:url value="css/w3.css" />"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>

</head>
<body>

<div class="w3-container w3-center">
    <h1 style="text-align: center"><spring:message code="page.customers.title"/></h1>

    <div class="btns">
        <a class="w3-button w3-green w3-margin-bottom" href="<c:url value="/" />"><spring:message
                code="application.back"/>
        </a>
    </div>
    <table id="appTable" class="w3-centered w3-table-all">
        <thead>
        <tr class="w3-light-grey">
            <th><spring:message code="application.id"/></th>
            <th><spring:message code="application.customer"/></th>
            <th>Email</th>
            <th><spring:message code="application.city"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customers}" var="elem">
            <tr>
                <th scope="row">${elem.id}</th>
                <td>
                    <a href="customer/${elem.id}">
                            ${elem.firstName} ${elem.lastName}
                    </a>
                </td>
                <td>${elem.email}</td>
                <td>${elem.address.city.city}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script>

    function lunchTable() {

        let location = "static/langages"
        $(document).ready(function () {
            $('#appTable').DataTable({
                "bInfo": true, //Dont display info e.g. "Showing 1 to 4 of 4 entries"
                "paging": false,//Dont want paging
                "bPaginate": false,//Dont want paging
                "processing": true,
                language: {
                    url: location
                }
            });
        });
    }

    lunchTable();

</script>
</body>
</html>
