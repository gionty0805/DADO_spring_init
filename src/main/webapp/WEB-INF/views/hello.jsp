<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board List</title>
</head>
<body>
<h1>Board world!</h1>
<c:forEach items="${list}" var="board">
${board.title}
</c:forEach>
</body>
</html>