<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="content-wrapper">

	<!-- Page header -->
	<div class="page-header page-header-light">
		<div class="page-header-content d-sm-flex">
			<div class="page-title" style="width: 100%;">
				<h6 class="mr-2 mt-1 font-weight-semibold float-left ml-2">회원 관리</h6>
			</div>
		</div>
	</div>
	<!-- /page header -->


	<!-- Content area -->
	<div class="content">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="row searchUser" style="margin-left: 0; margin-right: 0; margin-bottom: 20px">
			<select class="custom-select col-lg-1 mr-2 searchType">
				<option value="userId">아이디</option>
				<option value="userName">회원 이름</option>
				<option value="userDpt">소속</option>
			</select>
			<input type="text" class="col-lg-2 mr-2 searchText">
			<button type="button" class="ml-2 btn btn-primary searchUserBt">검색</button>
		</div>
		<!-- Basic card -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">회원 리스트</h5>
			</div>
			<div class="table-responsive">
				<table class="table text-center">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>회원 이름</th>
							<th>회원 등급</th>
							<th>소속</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>가입일자</th>
							<th>회원정보 수정</th>
						</tr>
					</thead>
					<tbody id="userList">

					</tbody>
				</table>

				<div id="modal_user" class="modal fade userModify" tabindex="-1">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header pb-3">
								<h5 class="modal-title">회원정보 수정</h5>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body py-0">
								<div class="row">
									<label class="col-form-label font-weight-bold col-lg-2">회원명</label> <input type="text" class="form-control col-form-label col-lg-10 userName"></input>
								</div>

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">소속</label> <input type="text" class="form-control col-form-label col-lg-10 userDepartment"></input>
								</div>

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">이메일</label> <input type="text" class="form-control col-form-label col-lg-10 email"></input>
								</div>

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">연락처</label> <input type="text" class="form-control col-form-label col-lg-10 userPhone"></input>
								</div>
								
								<input type="hidden" class="userNo" value="">

								<div class="row mt-3">
									<label class="col-form-label font-weight-bold col-lg-2">회원 등급</label>
									<div class="col-lg-10" style="padding: 0px">
										<select class="custom-select">
											<option value="opt1">관리자</option>
											<option value="opt2">작업자</option>
											<option value="opt3">승인 대기</option>
										</select>
									</div>
								</div>

								<div class="modal-footer pt-3">
									<button type="button" class="btn btn-link userGradeModifyClose" data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary userModifyBt">회원정보 수정</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /scrollable modal -->

				</div>



				<div class="mt-3 mb-3 text-center">
					<ul class="pagination pagination-flat align-self-center" id="pager">
						<li class="page-item"><a href="#" class="page-link">← &nbsp; Prev</a></li>
						<li class="page-item active"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item disabled"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">Next &nbsp; →</a></li>
					</ul>
				</div>


			</div>
			<!-- /basic card -->

			<!--회원 추가 button-->

			<div class="" style="position: fixed; bottom: 30px; right: 30px; z-index: 1;">
				<button type="button" class="btn btn-round userInsertModal" data-toggle="modal" data-target="#modal_scrollable">
					회원 추가<i class="fas fa-plus mt-2"></i>
				</button>
			</div>
			<!--회원 추가 button end-->

			<!--회원 추가 modal-->
			<div id="modal_scrollable" class="modal fade" tabindex="-1">
				<div class="modal-dialog modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header pb-3">
							<h5 class="modal-title">회원 추가</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body py-0 userInsert">

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">아이디</label> <input type="text" class="form-control col-lg-9 userId" value="" maxlength="10" minlength="5">
								<div class="col-lg-3"></div>
								<div class="userIdChkMsg col-lg-9"></div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">비밀번호</label> <input type="password" class="form-control col-lg-9 userPw" value="" minlength="5">
								<div class="col-lg-3"></div>
								<div class="col-lg-9 userPswMsg"></div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">비밀번호 확인</label> <input type="password" class="form-control col-lg-9 userPwChk" value="" minlength="5">
								<div class="col-lg-3"></div>
								<div class="col-lg-9 userPswChkMsg"></div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">회원 이름</label> <input type="text" class="form-control col-lg-9 userName" value="" minlength="2">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">회원 등급</label>
								<div class="col-lg-9 p-0">
									<select class="custom-select userGrade">
										<option value="opt1">관리자</option>
										<option value="opt2">작업자</option>
										<option value="opt3">승인대기</option>
									</select>
								</div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">소속</label> <input type="text" class="form-control col-lg-9 userDepartment" value="">
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">이메일</label> <input type="text" class="form-control col-lg-9 userEmail" value="">
								<div class="col-lg-3"></div>
								<div class="col-lg-9 userEmailChkMsg"></div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">연락처</label> <input type="text" class="form-control col-lg-9 userHp" value="" maxlength="13">
								<div class="col-lg-3"></div>
								<div class="col-lg-9 userPhoneChkMsg"></div>
							</div>

							<div class="form-group row mt-3">
								<label class="col-form-label col-lg-3">회원사진</label> <input type="file" class="form-control col-lg-9 userImage">
							</div>

						</div>

						<div class="modal-footer pt-3">
							<button type="button" class="btn btn-link" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary userInsertBt">회원 등록</button>
						</div>
					</div>
				</div>
			</div>

			<!--회원 추가 modal end-->


		</div>
		<!-- /content area -->



	</div>
	<!-- /main content -->
</div>

<script>

$(document).ready(function() {
	
});

//수정버튼 클릭
$(document).on("click",".listUserModify", function(){
	var userNo = $(this).attr("value");
	//console.log(userNo);
	userGradeModifyList(userNo);
});

//회원등급 수정 조회
function userGradeModifyList(userNo){
	
    $.ajax({
        url: '/user/userGradeModifyList',
        method: 'GET',
        data: {userNo: userNo},
        success: function(data) {
        	console.log(data);
        	userGradeModifyListModal(data);
        },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
	
}

//회원등급 수정 모달창
function userGradeModifyListModal(data){
	
	var name = `\${data[0].userName}`;
	var department = `\${data[0].userDepartment}`;
	var email = `\${data[0].email}`;
	var phone = `\${data[0].hp}`;
	var grade = `\${data[0].userGrade}`;
	var userNo = `\${data[0].userNo}`;
	
	//console.log(userNo);
	
	
	$(".userModify .userName").each(function() {
		$(this).val(name)
	})
	
	$(".userModify .userDepartment").each(function() {
		$(this).val(department)
	})
	
	$(".userModify .email").each(function() {
		$(this).val(email)
	})
	
	$(".userModify .userPhone").each(function() {
		$(this).val(phone)
	})
	
	$(".userModify .userNo").each(function() {
		$(this).val(userNo)
	})
	
	$(".userModify .custom-select").each(function() {
		
		if(grade == "관리자"){
			$(this).val('opt1');
		}else if(grade == "작업자"){
			$(this).val('opt2');
		}else{
			$(this).val('opt3');
		}//if end
		
	})
	
}

function nvl(data){
	if(!data || data=='null'){
		return "";
	}else{
		return data;
	}
}

getUserList = function(curPage){
	var keyword = "";
	
	if(!curPage){curPage=1}
	
	$.ajax({
		url:"${pageContext.request.contextPath}/user/getUserList",
		data: "curPage="+curPage,
		success: function(result){
			console.log(result);
			
			var list = result.list;
			
			var table = ''
			$.each(list,function(index,item){
				
				table+=`<tr>`
				table+=`<td>\${nvl(item.userNo)}</td>`
				table+=`<td>\${nvl(item.userId)}</td>`
				table+=`<td>\${nvl(item.userName)}</td>`
				table+=`<td>\${nvl(item.userGrade)}</td>`
				table+=`<td>\${nvl(item.userDepartment)}</td>`
				table+=`<td>\${nvl(item.email)}</td>`
				table+=`<td>\${nvl(item.hp)}</td>`
				table+=`<td>\${nvl(item.regiDate).substring(0, 16)}</td>`
				table+=`<td><button class="btn btn-info listUserModify" type="button" data-toggle="modal" data-target="#modal_user" value="\${item.userNo}">수정</button></td>`
				table+= `</tr>`
			})
			$('#userList').html(table);
			
			var pager = result.pager;
			
			var pagerContent = "";
			if(pager.curRange!=1){pagerContent+="<li class='page-item' onclick='getUserList("+(pager.startPage-1)+")'><a href='#' class='page-link'><<a></li>"}
			for(i=pager.startPage;i<=pager.endPage;i++){
				if(i!=pager.curPage){pagerContent+="<li class='page-item' onclick='getUserList("+i+")'><a href='#' class='page-link'>"+i+"</a></li>"}
				if(i==pager.curPage){pagerContent+="<li class='page-item active' onclick='getUserList("+i+")'><a href='#' class='page-link'>"+i+"</a></li>"}
			}
			if(pager.curRange!=pager.rangeCnt){pagerContent+="<li class='page-item' onclick='getUserList("+(pager.endPage+1)+")'><a href='#' class='page-link'>></a></li>"}
			
			if(table!=''){
				$("#pager").html(pagerContent);
			}else{
				$('#userList').html('<tr><td colspan="8">사용자가 없습니다.</td></tr>');
				$("#pager").html('');
			}
		},
		error:function(request,status,error){
		   alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		}
			
	})
}

getUserList(1)


//회원검색 버튼 클릭
$(document).on("click",".searchUserBt", function(){
	var searchType = $(".searchUser .searchType option:selected").val();
	var searchText = $(".searchUser .searchText").val();
	var curPage = 1;

	$.ajax({
		url: "${pageContext.request.contextPath}/user/userSearchList",
		data: {
			searchType: searchType,
			searchText: searchText,
			curPage: curPage
		},
		success: function(result){
			console.log(result);
						
			var list = result.list;
			
			var table = ''
			$.each(list,function(index,item){
				
				table+=`<tr>`
				table+=`<td>\${nvl(item.userNo)}</td>`
				table+=`<td>\${nvl(item.userId)}</td>`
				table+=`<td>\${nvl(item.userName)}</td>`
				table+=`<td>\${nvl(item.userGrade)}</td>`
				table+=`<td>\${nvl(item.userDepartment)}</td>`
				table+=`<td>\${nvl(item.email)}</td>`
				table+=`<td>\${nvl(item.hp)}</td>`
				table+=`<td>\${nvl(item.regiDate).substring(0, 16)}</td>`
				table+=`<td><button class="btn btn-info listUserModify" type="button" data-toggle="modal" data-target="#modal_user" value="\${item.userNo}">수정</button></td>`
				table+= `</tr>`
			})
			$('#userList').html(table);
			
			var pager = result.pager;
			
			var pagerContent = "";
			if(pager.curRange!=1){pagerContent+="<li class='page-item' onclick='getUserList("+(pager.startPage-1)+")'><a href='#' class='page-link'><<a></li>"}
			for(i=pager.startPage;i<=pager.endPage;i++){
				if(i!=pager.curPage){pagerContent+="<li class='page-item' onclick='getUserList("+i+")'><a href='#' class='page-link'>"+i+"</a></li>"}
				if(i==pager.curPage){pagerContent+="<li class='page-item active' onclick='getUserList("+i+")'><a href='#' class='page-link'>"+i+"</a></li>"}
			}
			if(pager.curRange!=pager.rangeCnt){pagerContent+="<li class='page-item' onclick='getUserList("+(pager.endPage+1)+")'><a href='#' class='page-link'>></a></li>"}
			
			if(table!=''){
				$("#pager").html(pagerContent);
			}else{
				$('#userList').html('<tr><td colspan="8">사용자가 없습니다.</td></tr>');
				$("#pager").html('');
			}
			
		},
		error:function(request,status,error){
		   alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		}
			
	})
});



$(document).on("click",".userModifyBt", function(){
	var userGrade = $(".userModify .custom-select option:checked").text()
	var userNo = $(".userModify .userNo").val()
	var userName = $(".userModify .userName").val()
	var userDepartment = $(".userModify .userDepartment").val()
	var userPhone = $(".userModify .userPhone").val()
	var userEmail = $(".userModify .email").val()
	//console.log(grade);
	//console.log(userNo);
	userInfoModify(userGrade, userNo, userName, userDepartment, userPhone, userEmail);
});


//회원등급 수정
function userInfoModify(userGrade, userNo, userName, userDepartment, userPhone, userEmail){
	
    $.ajax({
        url: '/user/userInfoModify',
        method: 'GET',
        data: { userGrade: userGrade,
        		userNo: userNo,
        		userName: userName, 
        		userDepartment: userDepartment, 
        		userPhone: userPhone, 
        		userEmail: userEmail
        		},
        success: function(data) {
        	console.log(data);
        	alert("회원정보가 수정 되었습니다.");
        	location.reload();
       },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
	
}


//회원추가 버튼 클릭
$(document).on("click",".userInsertModal", function(){
	var fields = ['userId', 'userPw', 'userPwChk', 'userName', 'userGrade', 'userDepartment', 'userEmail', 'userPhone'];
	fields.forEach(function(field) {
		$(".userInsert ." + field).val('');
	});
	$(".userIdChkMsg").text('');
	$(".userPswChkMsg").text('');
	$(".userPhoneChkMsg").text('');
});


//아이디 중복 확인
$(".userId").keyup(function() {
	var userId = $(this).val();
	var isID = /^[a-z0-9][a-z0-9_\-]{4,9}$/;  // ID 유효성 검사 정규식
	if (userId !== '') {
		userId = userId.replace(/\s/g, '');  // 스페이스 제거
		$(this).val(userId);  // 수정된 값 다시 설정
		if (!isID.test(userId)) {  // ID 유효성 검사
			$(".userIdChkMsg").css("color", "red").text("5~10자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		} else {
			$(".userIdChkMsg").css("color", "black").text(userId);
			userIdChk(userId);
	    }
	}else{
		$(".userIdChkMsg").css("color", "red").text("아이디를 입력해주세요.");
	}
});


//아이디 중복 확인
function userIdChk(userId){
    $.ajax({
        url: '/user/userIdChk',
        method: 'GET',
        data: { userId: userId
        },
        success: function(data) {
        	console.log(data);
        	if(data == 1){
        		$(".userIdChkMsg").css("color", "red").text(userId+"는(은) 사용중인 아이디 입니다");
        	}else{
        		$(".userIdChkMsg").css("color", "green").text(userId+"는(은) 사용가능한 아이디 입니다");
        	}
       },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
}//userIdChk() end


//비밀번호 확인
$(".userPw, .userPwChk").on('keyup', function() {
    var userPw = $(".userPw").val();
    var userPwChk = $(".userPwChk").val();
	if(userPw == ''){
        $(".userPswMsg").css("color", "red").text('비밀번호을 입력해주세요');
        $(".userPswChkMsg").text('');
	}else if(userPw !== ''){
		$(".userPswMsg").text('');
	    if (userPw !== userPwChk) {
	        $(".userPswChkMsg").css("color", "red").text('비밀번호가 일치하지 않습니다');
	    } else {
	        $(".userPswChkMsg").css("color", "green").text('비밀번호가 일치합니다');
	    }//if end
	}//if end
});


//이메일 확인
$(".userEmail").on('keyup', function() {
    var userEmail = $(".userEmail").val();
    var regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
    console.log(userEmail)
    if(userEmail == ''){
        $(".userEmailChkMsg").css("color", "red").text('이메일을 입력해주세요');
    } else if(regex.test(userEmail)) {
        $(".userEmailChkMsg").css("color", "green").text('사용할수 있는 이메일 입니다.');
    } else {
        $(".userEmailChkMsg").css("color", "red").text('이메일을 확인해주세요.');
    }
});


//연락처 확인
$(".userHp").on('keyup', function() {
    var userHp = $(".userHp").val();
    var regex = new RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/);
    console.log("userPhone"+userHp)
    if(userHp == ''){
        $(".userPhoneChkMsg").css("color", "red").text('연락처를 입력해주세요');
    } else if(regex.test(userHp)) {
        $(".userPhoneChkMsg").css("color", "green").text('사용할수 있는 연락처 입니다.');
    } else {
        $(".userPhoneChkMsg").css("color", "red").text('연락처를 확인해주세요.');
    }
});




//모달 회원등록 버튼 클릭시 회원 추가
$(document).on("click",".userInsertBt", function(){
    var formData = new FormData();
	var userId = $(".userInsert .userId").val();
	var userPw = $(".userInsert .userPw").val();
	var userName = $(".userInsert .userName").val();
	var userGrade = $(".userInsert .userGrade option:selected").text();
	var userDepartment = $(".userInsert .userDepartment").val();
	var userEmail = $(".userInsert .userEmail").val();
	var userPhone = $(".userInsert .userHp").val();
	
	console.log(userId)
	
    // formData에 파라미터 추가
    formData.append("userId", userId);
    formData.append("userPw", userPw);
    formData.append("userName", userName);
    formData.append("userGrade", userGrade);
    formData.append("userDepartment", userDepartment);
    formData.append("userEmail", userEmail);
    formData.append("userPhone", userPhone);
    
	var userImage = $(".userInsert .userImage")[0].files[0];

	if(userImage) {
		formData.append('file', userImage);
	}
    
    
	
	if(userId == '' || userId.length <5){
		alert("아이디를 확인해 주세요");
		return;
	}
	if(userPw == '' || userPw.length < 5){
		alert("비밀번호를 확인해 주세요");
		return;
	}
	if(userName == ''){
		alert("이름을 확인해 주세요");
		return;
	}
	if(userGrade == ''){
		alert("회원등급을 확인해 주세요");
		return;
	}
	if(userDepartment == ''){
		alert("소속을 확인해 주세요");
		return;
	}
	if(userEmail == ''){
		alert("이메일을 확인해 주세요");
		return;
	}
	if(userPhone == '' || userPhone.length <13){
		alert("연락처를 확인해 주세요");
		return;
	}
	
	let token = $("input[name='_csrf']").val();
	let header = "X-CSRF-TOKEN";
	
	
    $.ajax({
        url: '/user/userInsert',
        method: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
    	processData: false,
    	contentType: false,
        beforeSend : function(xhr) {  
			xhr.setRequestHeader(header, token);
		},
        success: function(data) {
        	console.log(data);
			alert("회원이 추가 되었습니다.");
           	location.reload();
       },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert(jqXHR.status);
	        alert(jqXHR.statusText);
	        alert(jqXHR.responseText);
	        alert(jqXHR.readyState);
	    }
    });//ajax end
    
	
});











</script>
<style>
<!--
#pager{
	justify-content: center;
	border-top: 1px solid #ddd;
    padding-top: 10px;
}
-->
</style>