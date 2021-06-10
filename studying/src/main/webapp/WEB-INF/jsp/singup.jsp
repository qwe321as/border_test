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
   obj.name = mForm.name.value; 
   obj.birth= mForm.birth.value;
   obj.hp = mForm.hp.value; 
   obj.hpcop= mForm.hpcop.value;
   obj.gender = mForm.gender.value; 
   obj.email= mForm.email.value;
   
   alert(obj.hpcop);
   var request = $.ajax({
    url:"/useradd",
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
      alert("이미 등록되어 있는 아이디 입니다.");
     } else if (data.state == 200) {
      alert("등록 완료! 로그인 하시기 바랍니다.");
     }else{
      alert("등록실패 관리자에게 문의하세요!");
     }
    }
   });
   request.fail(function(jqXHR, textStatus){ // 에러 발생
    alert("등록 오류 발생!");
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
			<input type="text" name="name" class="form-control" placeholder="Enter Username"  required/>
		</div>

		<div class="form-group">
			<input type="text" name="id"  class="form-control" placeholder="Enter ID"  required/>
		</div>
		<div class="form-group">
			<input type="password" name="pw"  class="form-control" placeholder="Enter Password"  required/>
		</div>
		
		<div class="form-group">
			<input type="email" name="email"  class="form-control" placeholder="Enter Email"  required/>
		</div>
		
		<div class="form-group">
			<input type="date" name="birth"  class="form-control" required/>
		</div>
		
		<div class="form-group">
			<input type="text" name="gender"  class="form-control" placeholder="Enter gender" required />
		</div>

		<div class="form-group">
			<input type="text"  name="hpcop"  class="form-control" placeholder="Enter hpcop" required />
		</div>
		
		<div class="form-group">
			<input type="text"  name="hp"  class="form-control" placeholder="Enter hp" required />
		</div>

		<br/>
		<button type="button" onclick="insert_action()" class="btn btn-primary">회원가입완료</button>
	</form>
</div>
</body>
</html>
