
function getReivew(){
	    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getReviewList.do",
        data: {"mem_code": mem_code},
        success : function(data){
        	var str="";
        	$(".review").html("");
        	$.each(data,function(idx,item){
        		if(mem_code == item.mem_code && pro_code == item.pro_code){
				str += "<div>";
				str +=  "<p style='color:black;font-size:11px'> 구매내역: "  + item.pro_name + "&emsp;&emsp;" + ' 구매자: '+ item.name + "&emsp;&emsp;" + '작성날짜: ' + item.review_date + "</p>";
				str +=  "<div style='color:black;font-size:16px;background-color:white;height:15%;border-radius:25px;border:2px dashed;'><p  style='margin-left: 2%; margin-right:2%' >" + item.content + "</p></div>"  ;
				str += "</div><hr><hr>";
					};
        		
        	$(".review").html(str);
        	});
        },
        
        error : function(request,status,error){
            console.log("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}
