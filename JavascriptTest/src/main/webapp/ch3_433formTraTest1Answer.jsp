<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ch3_433formTraTest1Answer.jsp</title>

<style type="text/css">


</style>


</head>


<body>
	<div id='divObj'> 
		<form action="#" name='formObj' method="get">
			<div style="border: 1px solid black;">
				<input id='txt1' type="text" name="pwd" value="">
				<input id='txt2' type="text" value="" title="value에 비번 확인 입력하기">
			</div>
			<div style="border: 1px solid black;">
				<input id='checkBtn' type="button" value="저장">
				<input id='goBtn' type="submit" value="전송">
			</div>
			
		</form>
	</div>

</body>
<script type="text/javascript">

	var frm1 = document.formObj;
	var frm2 = document.forms[0];
	
	frm1.pwd.value = "kbg";
	frm2.txt2.value = frm1.pwd.value;
// 	frm2[1].value = frm1.pwd.value;
		
</script>

</html>