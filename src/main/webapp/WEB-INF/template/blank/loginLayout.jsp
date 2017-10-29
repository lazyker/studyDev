<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/xenon-core.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/xenon-forms.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/xenon-components.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/xenon-skins.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
    
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.12.3.min.js" type="text/javascript"></script>
</head>
<body class="page-body login-page login-light">
    <tiles:insertAttribute name="content" flush="true"/>
</body>
</html>