<%-- 
    Document   : manage_user
    Created on : Mar 22, 2021, 12:02:57 AM
    Author     : 699785
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        <h2>All Users</h2>


        <c:forEach var="user" items="${users}">
            <p>  ${user.email}</p>
        </c:forEach>

        ${m.email}
        ${m.firstname}
        ${m.lastname}
    </body>
</html>
