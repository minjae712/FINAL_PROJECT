
function getBestList(){
	
	    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestList.do",
        success : function(data){
        	
        	var str = "";
        	$.each(data,function(idx,item){
    			str += "<div><table class='table table-condensed' style='width: 100%'>";
    			str += "<tr style='font-size=2em;' color='#CCEEFF;'><td  style='background-color: #FE642E;' width='72%'><a href='getBoard.do?no= " + item.no +"'>"+ item.title + "</td>";
    			str += "<td style='background-color:#FE642E;' width='33%'>" + item.writer + "</td>";
    			str += "<td align='right' style='background-color: #FE642E; width='23%' >" + item.cnt + "</td></tr></table><div>";
        	$("#bestList").html(str);
        	});
        },
        
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}


