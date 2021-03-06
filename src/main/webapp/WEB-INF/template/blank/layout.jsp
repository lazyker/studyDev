<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><tiles:getAsString name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layoutPop.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sms_common.css" />
    <tiles:insertTemplate template="/WEB-INF/template/basic/js.jsp" flush="true"/>
</head>
<body style="overflow-x:hidden">
    <tiles:insertAttribute name="content" flush="true"/>
</body>
</html>