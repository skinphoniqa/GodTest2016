<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld"%>
<%
 /**
  * @JSP Name : EgovOperImprovReqDstbList.jsp
  * @Description : 운영개선요청 분배 List 화면
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.07.20  박수림         최초 생성
  *
  * author 운영환경 1팀
  * since 2010.07.20
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */ 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-language" content="ko">
<title>운영개선요청작업분배</title>
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>" rel="stylesheet" type="text/css" >
<link href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" language="javascript" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>

<script type="text/javascript">
$(function() {
	$("#accordion").accordion({
		collapsible: true
	});	
$("#accordion").css({'background':'#f1f1f1','font-family':'굴림','border':'1px solid #d5d5d5','height':'390px'});	
$(".table_style tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});

$("div.linkdiv a").click(function(){ 	
	var topurl=$(this).attr("href");
	$('#content').load(topurl);
	});	
			
	$(".image_rollover").mouseover(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //ff
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "ff") $(this).attr("src", file_name + "n." + file_type);
	}).mouseout(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //on
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "on") $(this).attr("src", file_name + "off." + file_type);
	});			
});	
</script>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 조회 화면 function */
function fn_egov_select(id) {
	document.listForm.selectedId.value = id;
   	document.listForm.action = "<c:url value='/cms/srm/admin/selectOperImprovReqDstb.do'/>";
   	document.listForm.submit();

   	/* 상세팝업 띄우기
	var retVal;
	var url = "<c:url value='/cms/srm/selectOperImprovReqPop.do'/>?selectedId="+id;
	var varParam = new Object();
	varParam.selectedId = id;		
	var openParam = "dialogWidth:820px;dialogHeight:520px;scroll:no;status:no;center:yes;resizable:yes;";

	retVal = window.showModalDialog(url, varParam, openParam);

	return retVal;
	*/
	
}

/* 목록 화면 function */
function fn_egov_selectList() {
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/cms/srm/admin/selectOperImprovReqDstbList.do'/>";
   	document.listForm.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cms/srm/admin/selectOperImprovReqDstbList.do'/>";
   	document.listForm.submit();
}


/* 체크박스 전체선택 function */
function fncCheckAll() {
    var checkField = document.listForm.checkYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* 체크박스 선택 function */
function fncManageChecked(tempValue) {

	var resultCheck = false;

    var checkField = document.listForm.checkYn;
    var checkId = document.listForm.checkId;
       
    var returnId = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(tempValue == "Y") {
	                    if(returnId == "") {
	                        returnId = "'" + checkField[i].value + "'";
	                    }
	                    else {
	                    	returnId = returnId + ",'" + checkField[i].value + "'";
	                    }
                    } else {
	                    if(returnId == "") {
	                        returnId = checkField[i].value;
	                    }
	                    else {
	                    	returnId = returnId + "|" + checkField[i].value;
	                    }
                    }
                }
            }
            if(checkedCount > 0) { 
            	resultCheck = true;
            } else {
                alert("선택된 개선요청이 1건 이상 존재하여야 위험등록이 가능합니다.");
                resultCheck = false;
            }
        } else {
        	 if(document.listForm.checkYn.checked == false) {
                alert("선택된 개선요청이 1건 이상 존재하여야 위험등록이 가능합니다.");
                resultCheck = false;
            }
            else {
            	if(tempValue == "Y") {
                    returnId = "'" + checkId.value + "'";
            	} else {
                    returnId = checkId.value;
            	}
                resultCheck = true;
            }
        } 
        
    } else {
        alert("조회된 결과가 없습니다.");
        resultCheck = false;
    }

	if(resultCheck == false){
		return false;
	}
    //alert(returnId);
    //document.listForm.checkIds.value = returnId;
    //opener.fn_egov_OperImprovReqIds_Callback(returnId);
    //return resultCheck;
    //window.close();
	//document.listForm.action = "<c:url value='/cms/stn/EgovOe1RiskManageRegist.do'/>?operImprvmRequstId="+returnId;
   	//document.listForm.submit();
   	location.href="<c:url value='/cms/stn/admin/EgovOe1RiskManageRegist.do'/>?operImprvmRequstId="+returnId;
}

/* 요청자 contact 정보 조회 function */
function fn_egov_select_contact(mberId){
    var url   = "<c:url value='/cms/srm/gnrl/selectOperImprovReqContactPop.do'/>?mberId=" + mberId;
    var id    = "요청자contact정보";
    var param = "width=400px,height=200px,toolbar=no,location=no,status=no,scrollbar=yes,resizable=no,left=200,top=200";

    window.open(url, id, param);
}
-->
</script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovTop.jsp" /></div>
    <div id="topnavi"><c:import url="/cms/com/EgovOe1BarMenu.do" charEncoding="utf-8"/></div>  
    <!-- //header 끝 -->    

    <!-- 메인 시작 -->
    <div id="container">
        <!-- 좌메뉴 시작 -->
        <div id="leftmenu"><c:import url="/cms/com/EgovOe1LeftMenu.do" charEncoding="utf-8"/></div>
        <!-- 좌메뉴 끝 -->


<div id="content"><!-- BODY 내용 START -->
<div id="content_pop">
<form:form commandName="vo" name="listForm" method="post" action="selectOperImprovReqDstbList.do" onsubmit="javascript:fn_egov_selectList(); return false;">
<input type="hidden" name="selectedId" />
<input type="hidden" name="nowUrl" value="<egovc:out value='<%=request.getRemoteAddr()%>'/>"/>
<input type="hidden" name="nowUrl2" value="<egovc:out value='<%=request.getRequestURI()%>'/>"/>

	<!-- 타이틀 -->
	<div id="h2_topnav"><h1><strong> 운영개선요청 작업분배 목록 </strong></h1></div>
	<!-- // 타이틀 -->
	<div class="search_area_submit">
		<ul>
			<li><img src="<c:url value='/images/egovframework/oe1/cms/com/img_search01.gif'/>" alt="search" class="searchimg" /></li>
			<li>&nbsp;&nbsp;
					<form:select path="srequstSttusCode" cssClass="use" cssStyle="width:100px;" title="상태" tabindex="1">
					<form:option value="" label="--처리상태--"   />
		           	<c:forEach var="codeinfo" items="${srequstSttusCode}" varStatus="status">
					<form:option value="${codeinfo.code}" label="${codeinfo.codeNm}"   />
				  	</c:forEach>  
		          	</form:select>			
			</li>
			<li>
					<form:select path="soperJobSeCode" cssClass="use" cssStyle="width:100px;" title="업무" tabindex="2">
					<form:option value="" label="--업무구분--"   />
		           	<c:forEach var="codeinfo" items="${soperJobSeCode}" varStatus="status">
					<form:option value="${codeinfo.code}" label="${codeinfo.codeNm}"   />
				  	</c:forEach>  
		          	</form:select>			
			</li>
			<li>
				<form:select path="searchCondition" cssClass="use" cssStyle="width:100px;" title="검색조건" tabindex="3">
					<form:option value="" label="--세부구분--" />
					<form:option value="0" label="개선요청명" />
					<form:option value="1" label="내용" />
					<form:option value="2" label="요청자" />
				</form:select>
			</li>
			<li>
			<form:input path="searchKeyword" cssClass="input01" cssStyle="width:200px;" maxlength="30" title="검색어" tabindex="4"/>
			</li>
			<li>				
			    <div class="submit_gray_btn_top">		
				<ul>
					<li class="submit_gray_btn_left"></li>
					<li><span class="submit_gray_btn_middle"><input type="submit" value="검색" onclick="fn_egov_selectList(); return false;" class="submit_btn_input" /></span></li>
					<li class="submit_gray_btn_right"></li>
				</ul>
				</div>	
			</li>
		</ul>	
	</div>
	
	<!-- List -->
	<div id="result_table">
		<table summary="개선요청명,처리상태,업무구분,요청자,요청일,접수일,담당자,처리완료일 목록입니다" width="100%" border="0" cellpadding="0" cellspacing="0" class="table_style">
		<caption>운영개선요청 작업분배 목록   검색 결과</caption>
			<colgroup>			
				<col width="30">
				<col width="30">					
				<col width="190">			
				<col width="60">
				<col width="60">
				<col width="60">			
				<col width="75">
				<col width="75">			
				<col width="60">			
				<col width="75">		
			</colgroup>	
			<thead>	  
			<tr>
				<th scope="col" align="center">
					<input type="checkbox" name="checkAll" id="checkbox7" onclick="javascript:fncCheckAll();"  title="전체선택"/>
				</th>
				<th scope="col" align="center">순번</th>
				<th scope="col" align="center">개선요청명</th>
				<th scope="col" align="center">처리상태</th>
				<th scope="col" align="center">업무구분</th>
				<th scope="col" align="center">요청자</th>
				<th scope="col" align="center">요청일</th>
				<th scope="col" align="center">접수일</th>
				<th scope="col" align="center">담당자</th>
				<th scope="col" align="center">처리완료일</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${empty resultList}">
    			<tr>    
   		  			<td colspan="10">
	    			검색 결과가 없습니다.
  	  				</td>
    			</tr>
    		</c:if>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>
					<label>
						<input type="checkbox" name="checkYn" id="<c:out value="${result.operImprvmRequstId}"/>" title="선택"/>
						<input type="hidden"   name="checkId" value="<c:out value="${result.operImprvmRequstId}"/>" />
					</label>
				</td>
				<td><c:out value="${paginationInfo.totalRecordCount - (vo.pageIndex - 1) * vo.pageSize - status.count + 1}"/></td>
				<td align="left">
					<a href="<c:url value='/cms/srm/admin/selectOperImprovReqDstb.do'/>?selectedId=<c:out value='${result.operImprvmRequstId}'/>" onclick="fn_egov_select('<c:out value="${result.operImprvmRequstId}"/>'); return false;" class="board_text_link"><c:out value="${result.operImprvmRequstSj}"/></a>
				</td>
				<td><c:out value="${result.requstSttusCodeNm}"/>&nbsp;</td>
				<td><c:out value="${result.operJobSeCodeNm}"/>&nbsp;</td>
				<td>
					<a href="<c:url value='/cms/srm/gnrl/selectOperImprovReqContactPop.do'/>?mberId=<c:out value='${result.frstRegisterId}'/>" onclick="fn_egov_select_contact('${result.frstRegisterId}'); return false;" class ="board_text_link" target="_blank" title="새창">
						<c:out value="${result.frstRegisterNm}"/>
					</a>		
				</td>
				<td><c:out value="${result.frstRegisterPnttm}"/>&nbsp;</td>
				<td>
					<c:choose>
						<c:when test="${not empty result.rceptDt}">
							<c:out value="${result.rceptDt}"/>&nbsp;
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty result.chargerNm}">
							<c:out value="${result.chargerNm}"/>&nbsp;
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty result.processComptDe}">
							<c:out value="${result.processComptDe}"/>&nbsp;
						</c:when>
						<c:otherwise>
							<c:out value="-"/>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- List -->
	<div id="pagenav_div">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page" /> 
		<form:hidden path="pageIndex" />
	</div>	
	
  	<div class="subbtn_align">  		
	  	<ul>
  			<li class="btn02_leftbg"></li>
		    <li class="btn02_middlebg"><a href="<c:url value='/cms/stn/admin/EgovOe1RiskManageRegist.do'/>" onclick="fncManageChecked('Y'); return false;" class="btn_link">위험등록</a></li>
			<li class="btn02_rightbg"></li>
  		</ul>
  	</div>	

</form:form>
</div>	
<!-- BODY 내용 END --></div>

<!-- 카피라이트 시작 -->
<div id="footer"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
<!-- //카피라이트 끝 --></div>
<!-- 메인 끝 --></div>
<!-- //전체 DIV끝 -->

</body>
</html>
