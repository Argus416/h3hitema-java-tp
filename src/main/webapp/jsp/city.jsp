<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 	CSS (w3css) de la Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>

    <title>Countries JSP</title>
</head>

<body>

<div class="w3-container">
    <h2 style="text-align: center"><spring:message code="page.city.title"/></h2>
    <br>

    <div class="">

    </div>
    <table id="countriesTable" class="w3-centered w3-table-all">
        <thead>
        <tr class="w3-light-grey">
            <th><spring:message code="application.city"/></th>
            <th><spring:message code="application.country"/></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${city.city}</td>
            <td>${city.country.country}</td>
        </tr>
        </tbody>
    </table>
    <div id="mapWrapper">
        <div id="map">City wasn't found</div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm9345DpJI0rjI3RqX6Sg8s8D1fZ8OMAk&callback=initMap&v=weekly"
        defer
></script>

<script>
    let map;

    function initMap() {
        $.get(
            'https://maps.googleapis.com/maps/api/geocode/json?address=${city.city}&key=AIzaSyCm9345DpJI0rjI3RqX6Sg8s8D1fZ8OMAk'
        ).then((e) => {
            const [firstResult] = e.results;

            const {lat, lng} = firstResult.geometry.location;

            console.log({lat, lng});
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat, lng},
                zoom: 12,
            });
        });
    }

    window.initMap = initMap;
</script>
</body>
</html>
