<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>이메일 인증 확인</title>
</head>
<body>

	<script type="text/javascript">
		var memberEmail = '${memberEmail}';

		alert(memberEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다. 확인버튼을 누르면 로그인 페이지로 이동합니다.');

		self.location = "${pageContext.request.contextPath}/member/login";
	</script>
</body>
</html>