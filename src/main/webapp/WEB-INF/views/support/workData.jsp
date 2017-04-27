<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="Contents">
    <form id="frm" name="frm" method="post" enctype="multipart/form-data">
        <input type="hidden" id="bodId" name="bodId" value='<c:out value="${getWorkData.BOD_ID}" />' />
        <input type="hidden" name="bodType" value='2' placeholder="업무자료" />
        
    <div class="swrap">
        <div class="search2">
        	<c:choose>
        		<c:when test="${empty getWorkData.BOD_ID}">
        			<span class="d_search"><a href="javascript:;" id="setWorkData">등록</a></span>
        			<span class="d_search"><a href="<c:url value="./workDataList" />">목록</a></span>
        		</c:when>
        		<c:otherwise>
		            <span class="d_search"><a href="#" id="modWorkData">저장</a></span>
		            <span class="d_search"><a href="#" id="delWorkData">삭제</a></span>
		            <span class="d_search"><a href="<c:url value="./workDataList" />">목록</a></span>
        		</c:otherwise>
        	</c:choose>
        </div>
        <!--데이타테이블시작-->
        <table class="board_h" style="width:100%;">
            <colgroup>
            <col width="18%" />
            <col width="*" />
            </colgroup>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td>
						<input id="title" name="title" type="text" class="in2" value="<c:out value="${getWorkData.TITLE}" />" style="width:90%;" />                    	
					</td>
                </tr>
                <tr>	
                    <th>내용</th>
                    <td>
                    	<textarea id="contents" name="contents"><c:out value="${getWorkData.CONTENTS}" /></textarea>
                    	<script type="text/javascript">
	                    	CKEDITOR.replace( 'contents',{
	                    		customConfig : '/resources/js/ckeditor/config.js',
	                    		width: '100%',
	                    		height: 400
	                    	});
						</script>
                    </td>
                </tr>
                <tr>	
                    <th>첨부파일</th>
                    <td>
                    	<div class="filebox">
                            <c:choose>
                                <c:when test="${empty getWorkData.ORIGINAL_FILE_NM}">
                                    <a href="#this" class="upload-name">파일선택</a>
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="attId" id="attId" value='<c:out value="${getWorkData.ATT_ID}"></c:out>' />
                                    <input type="hidden" name="orgId" id="orgId" value='<c:out value="${getWorkData.CON_ID}"></c:out>' />
                                    <a href="#this" id="downloadFile" class="upload-name">${getWorkData.ORIGINAL_FILE_NM} (${getWorkData.FILE_SIZE}kb)</a>

                                    <span class="d_btn"><a href="#this" id="delFile">삭제</a></span>
                                </c:otherwise>
                            </c:choose>

							<label for="file">파일첨부</label> 
							<input type="file" id="file" name="file" class="upload-hidden"> 
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
	</div>
	</form>
</div>

<script type="text/javascript">

	$(document).ready(init);
	
	function init() {
	    $('#setWorkData').on('click', setWorkData);
	    $('#modWorkData').on('click', setWorkData);
	    $('#delWorkData').on('click', delWorkData);
	    $('#file').on('change', setFile);
	    $('#delFile').on('click', delFile);
	    $('#downloadFile').on('click', downloadFile);
	}
	
	function setWorkData() {
		var url = ($('#bodId').val() == '') ? '<c:url value="./setWorkData" />' : '<c:url value="./modWorkData" />';
		var form = document.frm;
		form.action = url;
		form.submit();
		alert("저장 하였습니다.");
	}
	
	function delWorkData() {
	    if (confirm('정말 삭제 하시겠습니까?')) {
			var url = '<c:url value="./delWorkData" />';
			var form = document.frm;
			form.action = url;
			form.submit();
	    }
	}
	
	function setFile() {
	    if(window.FileReader){  // modern browser
	        var filename = $(this)[0].files[0].name;
	      } 
	      else {  // old IE
	        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	      }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').text(filename);
	}
	
	function delFile() {
	    $('#downloadFile').text('파일선택').off('click', downloadFile);
	    $('#attId').val('');
	    $('#delFile').hide();
	}
	
	function downloadFile() {
	    var attId = $('#attId').val();
	    var url = '<c:url value="/downloadFile" />';
	    url += '?attId=' + attId;
	    
	    $(location).attr('href', url);
	}
	
</script>