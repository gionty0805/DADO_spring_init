<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix ="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

    <title>demo-1</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-grid.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-reboot.css" rel="stylesheet" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icons/dripicons/webfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icons/mdiicons/css/materialdesignicons.css">

    <%--jquery 는 최상단이 필요한 경우들 때문에 header로--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<sec:authorize access="!isAuthenticated()">
    <script>
        window.location.replace("/login");
    </script>
</sec:authorize>