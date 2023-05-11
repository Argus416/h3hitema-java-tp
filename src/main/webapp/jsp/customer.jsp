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
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<div class="w3-container w3-center">
    <h1 style="text-align: center"><spring:message code="application.customers"/></h1>

    <div class="btns w3-margin-bottom">
        <a class="w3-button w3-green " href="<c:url value="/customers" />"><spring:message code="application.back"/></a>
    </div>
    <table id="appTable" class="w3-centered w3-table-all">
        <thead>
        <tr class="w3-light-grey">
            <th><spring:message code="application.id"/></th>
            <th>${customer.id}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th><spring:message code="application.firstname"/></th>
            <td>
                ${customer.firstName}
            </td>
        </tr>
        <tr>
            <th><spring:message code="application.lastname"/></th>
            <td>
                ${customer.lastName}
            </td>
        </tr>
        <tr>
            <th scope="row">Email</th>
            <td>
                ${customer.email}
            </td>
        </tr>
        <tr>
            <th scope="row">Active</th>
            <td>
                ${customer.active}
            </td>
        </tr>
        <tr>
            <th><spring:message code="application.city"/></th>
            <td>
                ${customer.address.city.city}
            </td>
        </tr>
        <tr>
            <th><spring:message code="application.country"/></th>
            <td>
                ${customer.address.city.country.country}
            </td>
        </tr>
        </tbody>
    </table>

</div>
<div id="mapWrapper">
    <div id="map">City wasn't found</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm9345DpJI0rjI3RqX6Sg8s8D1fZ8OMAk&callback=initMap&v=weekly"
        defer
></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<script>
    let map;

    function initMap() {
        $.get(
            'https://maps.googleapis.com/maps/api/geocode/json?address=${customer.address.city.city}&key=AIzaSyCm9345DpJI0rjI3RqX6Sg8s8D1fZ8OMAk'
        ).then((e) => {
            const [firstResult] = e.results;

            const {lat, lng} = firstResult.geometry.location;

            console.log({lat, lng});
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat, lng},
                zoom: 8,
            });
        });
    }

    window.initMap = initMap;


</script>
</body>
</html>
