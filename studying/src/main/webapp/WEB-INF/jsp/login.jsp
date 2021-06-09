<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//code.jquery.com/jquery.js"></script>
 <!-- Ajax 사용을 위한 jquery -->
 <script src="//code.jquery.com/jquery.js"></script>
 
 <!-- JavaScript -->
 <script type="text/javascript">
  function insert_action(){
   var mForm = document.testForm; // form의 값을 가져오기 위함
   var obj = new Object(); // JSON형식으로 변환 할 오브젝트
   var main = new Object(); 
   obj.id = mForm.id.value; // form의 값을 오브젝트에 저장
   obj.pw= mForm.pw.value;
   alert(obj.id)
   var request = $.ajax({
    url:"/userlogin",
	contentType : "application/json; charset=UTF-8",
    type:"POST",
	data : JSON.stringify({
		request : obj
	})
    ,dataType:"json"
   });
   request.done(function(data){ // 전송 후, 결과 값 받아오는 부분
      alert(data.state);
    if (data != null){
     if (data.state == 207) { // 임의 값 JSON 형식의 {“error”:2} 값을 서버에서 전달
      alert("존재하지 않는 회원입니다.");
     } else if (data.state == 200) {
      alert("로그인 완료.");
     }else{
      alert("로그인 실패 관리자에게 문의하세요!");
     }
    }
   });
   request.fail(function(jqXHR, textStatus){ // 에러 발생
    alert("로그인 오류 발생!");
   });
  }
 </script>

<jsp:include page="top.jsp" flush="true"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>singup</title>

<body>
<div class="container">
	<form  name="testForm" id="testForm">
		<div class="form-group">
			<input type="text" name="id" id="id"  class="form-control" placeholder="Enter ID"  required/>
		</div>
		<div class="form-group">
			<input type="password" name="pw" id="pw" class="form-control" placeholder="Enter Password"  required/>
		</div>
		<br/>
		<button type="button" onclick="insert_action()" class="btn btn-primary">로그인완료</button>
	</form>
</div>
</body>
</html>
