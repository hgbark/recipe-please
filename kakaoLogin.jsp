<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao 로그인</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js">
</script>
</head>
<body>
  <a id="kakao-login-btn"></a>
  <a href="http://developers.kakao.com/logout"></a>
  
  <script type='text/javascript'>
    //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('f61c36ee28b1fe4d00e270bcf75d344d');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    alert(JSON.stringify(authObj));
     },
     fail: function(err) {
     alert(JSON.stringify(err));
     }
   });
    //
  </script>
</body>
</html>