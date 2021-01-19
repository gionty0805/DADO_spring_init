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
    <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body class="text-center">
<form class="form-signin" action="/login" method="post">
    <%--<img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">--%>
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="username" class="sr-only">Email address</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="Id" required="" autofocus="">
    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="Password" required="">
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
    <div>
        ${loginFailMsg}
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">© 2021</p>
    <sec:csrfInput/>
</form>


</body>

<%@include file="inc/inc-footer.jsp" %>