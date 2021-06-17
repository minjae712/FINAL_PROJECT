$(document).ready(function(){

		var c_user_id = $.cookie("userid");
        var c_user_pwd = $.cookie("password");

        //저장된 값이 있다면 입력 요소에 값 출력
        if( c_user_id && c_user_pwd != null ) {
            $("#id").val(c_user_id);
            $("#password").val(c_user_pwd);

            //체크박스는 다시 체크
            $("#autoSave").prop("checked", true);            
        }
        
        $("#autoSave").click(function(e) {            
            if ($(this).is(":checked")) {
                // 사용자에게 저장여부 확인후 취소시 체크박스 해제
                if (!confirm("공용 PC에서 로그인정보를 저장할 경우, 다른 사람에게 노출될 위험이 있습니다. 정보를 저장하시겠습니까?")    ) {
                    $("#autoSave").prop("checked", false);                    
                }
            }
        });
        
        $("#btnLogin").click(function(){
            
            if (!$("#id").val()) { //아이디를 입력하지 않으면.
                alert("아이디를 입력 해주세요!");
                $("#id").focus();
                return false;
            }
            if (!$("#password").val()) { //패스워드를 입력하지 않으면.
                alert("패스워드를 입력 해주세요!");
                $("#password").focus();
                return false;
            }

            if ($("#autoSave").is(":checked")) {
                //체크 되어있다면, 해당 정보를 1년간 유효하도록 쿠키 저장
                $.cookie("userid", $("#id").val(), {
                    "expires" : 365
                });                        
                $.cookie("password", $("#password").val(), {
                    "expires" : 365
                });
                

            } else {
                //체크가 해제되었다면 쿠키 삭제.
                $.removeCookie("id");
                $.removeCookie("password");
                c_user_id = null;
                c_user_pwd = null;
            }

            $("#loginForm").submit();
        });	
		
})