<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang='ko'>

<head>
	<meta charset="UTF-8">
	<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
	<meta name="language" content="ko" />
	<meta content='width=device-width, initial-scale=1.0' name='viewport' />
	<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]--> 

	<title>코즈엘 인트라넷</title>
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.12.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-ui.min.js" type="text/javascript"></script>
    
    <style type="text/css">
        body {
            background: #232323 url(${pageContext.request.contextPath}/resources/images/error/bg.png) repeat;
            margin: 0;
            padding: 0;
            font-family: NanumGothic, '나눔고딕', 'Malgun Gothic', '맑은 고딕', Gulim, '굴림', Dotum, '돋움', AppleGothic, sans-serif

        }

            /* Make HTML 5 elements display block-level for consistent styling */
        header, nav, article, section, aside, footer, address {
            display: block;

        }

        .wrapper {
            width: 960px;
            min-height: 720px;
            margin: 0 auto;
            text-align: center;
            background: url(${pageContext.request.contextPath}/resources/images/error/bg-light.png) no-repeat;
            padding-top: 20px;

        }

        a {
            color: #77dff1;
            text-decoration: none;
        }

        h1 {
            color: #77dff1;
            font-family: NanumGothic, '나눔고딕', 'Malgun Gothic', '맑은 고딕', Gulim, '굴림', Dotum, '돋움', AppleGothic, sans-serif;
            font-size: 30px;
            font-weight: lighter;
            text-shadow: 0px 2px 0px #000;
            margin: 30px 0 0 0;

        }

        h2 {
            color: #77dff1;
            font-family: NanumGothic, '나눔고딕', 'Malgun Gothic', '맑은 고딕', Gulim, '굴림', Dotum, '돋움', AppleGothic, sans-serif;
            font-size: 25px;
            font-weight: lighter;
            text-shadow: 0px 2px 0px #000;
            margin: 15px 0 15px 20px;
            text-align: left;

        }

        p {
            color: #fff;
            margin: 0;
            font-size: 20px;
            text-shadow: 0 -2px 0 #000;

        }

        p.move {
            font-size: 20px;
            color: #ccc;
        }

        .hr {
            display: block;
            border: none;
            width: 960px;
            height: 2px;
            background: url(${pageContext.request.contextPath}/resources/images/error/divider.png);
            margin: 10px 0;

        }

        .clear {
            clear: both;
        }

        .progress {
            height: 110px;
            margin: 80px 0;
            background: url(${pageContext.request.contextPath}/resources/images/error/progress-container.png) no-repeat;
            position: relative;

        }

        .txt-launch-day-hat {
            background: url(${pageContext.request.contextPath}/resources/images/error/txt-launch-day-hat.png) no-repeat;
            width: 117px;
            height: 159px;
            position: absolute;
            top: -120px;
            right: -45px;

        }

        .txt-launch-day {
            background: url(${pageContext.request.contextPath}/resources/images/error/txt-launch-day.png) no-repeat;
            width: 112px;
            height: 110px;
            position: absolute;
            top: -80px;
            right: -40px;

        }

        .progress-bar {
            height: 43px;
            background: #72dbf1 url(${pageContext.request.contextPath}/resources/images/error/progress-bar.png) repeat-x;
            position: absolute;
            top: 14px;
            left: 0px;
            border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -khtml-border-radius: 10px;
        }

        .progress-bar-container {
            width: 930px;
            height: 70px;
            margin-left: 13px;
            position: relative;

        }

        .mailing-list h2 {
            width: 400px;
            float: left;
        }

        .mailing-list form {
            display: block;
            width: 450px;
            float: right;
            margin: 5px 0 0 0;
        }

        .mailing-list input[type=text] {
            width: 280px;
            height: 16px;
            background: url(${pageContext.request.contextPath}/resources/images/error/form-bg.png) no-repeat;
            border: none;
            color: #c9c9c9;
            font-size: 14px;
            padding: 15px 10px;
            margin: 0;

        }

        .mailing-list input[type=button] {
            width: 90px;
            height: 44px;
            background: url(${pageContext.request.contextPath}/resources/images/error/btn-subscribe.png) no-repeat;
            border: none;
            text-indent: -5000px;
            cursor: pointer;
            margin: 0 0 0 -10px;
            text-transform: capitalize;

        }

        .mailing-list input[type=submit] {
            width: 90px;
            height: 44px;
            background: url(${pageContext.request.contextPath}/resources/images/error/btn-subscribe.png) no-repeat;
            border: none;
            text-indent: -5000px;
            cursor: pointer;
            margin: 0 0 0 -10px;
            text-transform: capitalize;

        }

        .mailing-list input[type=submit]:hover {
            background-position: 0 -44px;

        }

        .mailing-list input[type=submit]:active {
            background-position: 0 -88px;

        }

        .mailing-list input[type=text]:focus {
            outline: none;

        }

        .tipsy {
            margin-bottom: 25px;
            font-size: 18px;
            opacity: 0.8;
            filter: alpha(opacity=80);
            background-repeat: no-repeat;
            background-image: url(${pageContext.request.contextPath}/resources/images/error/tipsy.png);
            font-family: NanumGothic, '나눔고딕', 'Malgun Gothic', '맑은 고딕', Gulim, '굴림', Dotum, '돋움', AppleGothic, sans-serif;
            text-transform: uppercase;
        }

        .tipsy-inner {
            padding: 10px 20px;
            background-color: black;
            color: white;
            max-width: 400px;
            text-align: right;
            -webkit-box-shadow: 0 20px 15px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 20px 15px rgba(0, 0, 0, 0.5);
        }

        .tipsy-inner {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }

        .tipsy-north {
            background-position: top center;
        }

        .tipsy-south {
            background-position: bottom center;
        }

        .tipsy-east {
            background-position: right center;
        }

        .tipsy-west {
            background-position: left center;
        }

        .tipsy-container {
            border: 1px solid green;
        }
        #exception {
            text-align: left;
            display: none;
        }
    </style>
</head>
<body>
	<div class="wrapper">
		<div class="hr"></div>
    	<h1>페이지에 오류가 발생 하였습니다.</h1>
    	
    	<p>- 에러에 대한 문의사항은 이엠룩( <a
                            href="${pageContext.request.contextPath}/por/sendmail.do?to=admin@emlook.com"
                            target="_blank"><span class='text8'>admin@emlook.com</span></a> )으로 연락주시면 확인한 후 연락드리겠습니다.</p>
	
		<section class="progress">
	        <div class="progress-bar-container" id="tipsy" title="70% Complete">
	            <article class="progress-bar" style="width:70%"></article>
	        </div>
	        <article class="txt-launch-day-hat"></article>
		</section>

	    <div class="hr"></div>
	    <div class="clear"></div>
	    <div class="hr"></div>
	    <p class="move">go to <a href="javascript:history.back();" target="_self">Back</a></p>
	    <p class="move">go to <a href="${pageContext.request.contextPath}/support/progress" target="_self">Main</a></p>
	    <a href="javascript:exception()">Show/Hide Exception</a>
	    <div id="exception">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <c:set var="code" value="${requestScope['javax.servlet.error.status_code']}"/>
	                <c:set var="uri" value="${requestScope['javax.servlet.error.request_uri']}"/>
	                <td style="padding-top:7px;">
	                    <p>
	                        <c:choose>
	                            <c:when test="${code == 401}">
	                                Not Permission<br/>
	                            </c:when>
	                            <c:when test="${code == 404}">
	                                Not Found<br/>
	                            </c:when>
	                            <c:when test="${code == 500}">
	                                Error<br/>
	                            </c:when>
	                            <c:otherwise>
	                                Error<br/>
	                            </c:otherwise>
	                        </c:choose>
	                    </p>
	                    <p>
	                        code = ${code}<br/>
	                        <c:if test="${code != 401 && code != 404}">
	                            type = ${requestScope['javax.servlet.error.exception_type']}<br/>
	                            location = ${pageContext.exception.stackTrace[0]}<br/>
	                        </c:if>
	                        uri = ${uri}<br/>
	                        message = ${requestScope['javax.servlet.error.message']}<br/>
	                    </p>
	                </td>
	            </tr>
	        </table>
		</div>
	</div>

<script type="text/javascript">
	function exception (){
	    $('#exception').toggle();
	}
</script>
</body>
</html>