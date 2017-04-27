<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper_p">
    <!--팝업타이틀 시작-->
    <div class="top">
        <span class="pop_st">중복검사</span>
        <span class="close"><a href=""><img src="/resources/images/p_close.png" title="닫기"/></a></span>
    </div>
    <!--팝업타이틀 끝-->

    <div class="b_search">
        <div class="b_search2">
            <input class="t_search" style="width:325px;" type="text" name="searchText" id="searchText" placeholder="회사명" value='<c:out value="${comNm}" />' />
            <span class="search_icon pl5"><a href="#" id="search"></a></span>
        </div>
    </div>

    <div id="popcontents">
        <table class="board_list" style="width:100%;">
            <colgroup>
            <col width="*%" />
            </colgroup>
            <tbody>
                <tr>
                    <th>결과</th>
                </tr>
                <c:choose>
                    <c:when test="${companyLen > 0}">
	                    <tr>
		                    <td>
		                        <span style="color:red;">동일한 회사명이 존재합니다.</span>                        
		                    </td>
	                    </tr>
                    </c:when>
                    <c:when test="${companyLen eq 0}">
                        <tr>
                            <td>
                                <div style="algin-text: center; cursor: pointer;" id="comNm"><span style="background-color: #d2d2d4; font-size: 16px;'"><c:out value="${comNm}" /></span></div>
                                <div style="color:blue; margin-top: 5px;"><span>사용가능한 회사명 입니다.</span></div>                   
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
	                    <tr>
		                    <td>
		                        <div style="color:blue; margin-top: 5px;"><span>검색결과가 없습니다.</span></div>                   
		                    </td>
	                    </tr>
                    </c:otherwise>
                </c:choose>
              </tbody>
            </table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(init);
    
    function init() {
        $('#searchText').on('keydown', function(key) {
            if (key.keyCode == 13) {
                search();
            }
        });
        
        $('.search_icon').on('click', function() {
            search();
        });
        
        $('.close').on('click', function() {
            self.opener = self;
            window.close();
        });
        
        $('.close').on('click', function() {
            self.opener = self;
            window.close();
        });
        
        $('#comNm').on('click', function() {
            opener.companyForm.comNm.value = $('#searchText').val();
            window.close();
        });
    }
    
    function search() {
        var url = '<c:url value="./companyOverlapPop" />';
        url += '?comNm=' + $('#searchText').val();
        
        window.location.href = encodeURI(url);
    }
</script>
