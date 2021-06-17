<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

	<%
    String clientId = "YKYpuOJLQ2PUQWr6wdPJ";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "K5fHCbZF9w";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/Board/naverLogin.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        JSONParser parsing = new JSONParser();
        Object obj = parsing.parse(res.toString());
        JSONObject jsonobj = (JSONObject)obj;
        access_token = (String)jsonobj.get("access_token");
        refresh_token= (String)jsonobj.get("refresh_token");
       session.setAttribute("access_token", access_token);
       session.setAttribute("refresh_token", refresh_token);
       System.out.println("콜백");
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
	<form id="naverLogin_form" action="naverLogin.do" method="post">
	<input type="hidden" name="access_token" value="${access_token}">
  	<input type="hidden" name="refresh_token" value="${refresh_token}">
	</form>
	<script type="text/javascript">
	this.document.getElementById("naverLogin_form").submit();
	</script>
</body>
</html>