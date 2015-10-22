$(document).ready(function() {
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
	  timePicker12Hour : false,
	  timePicker : true,
  	  timePickerIncrement : 1,
      format: 'YYYY-MM-DD HH:mm:ss'
    }, function(start, end, label) {
      console.log(start.toISOString(), end.toISOString(), label);
    });
 });

function searchLog(){
	$("#logcontent").html("");
	$("#loading").show(); 
	var dateStr = $("#reservationtime").val();
    var loglevel = $("#loglevel").val();
	var keywords = $("#keywords").val();
	$.post("/monitor/log/search",{"date":dateStr,"level":loglevel,"keywords":keywords},function(data){
		$("#loading").hide(); 
		$("#logcontent").html(data);
	});
}

function showModal(orderId){
	$('#dispatchContent').html("");
	$.post("/monitor/order/dispatch",{"orderId":orderId},function(data){
		content = eval("(" + data + ")");
		$('#dispatchContent').append("<table class='table table-striped table-bordered table-hover'>");
		$('#dispatchContent').append("<thead><tr>");
		$('#dispatchContent').append("<th style='text-align:center'>导师昵称</th>");
		$('#dispatchContent').append("<th style='text-align:center'>分发时间</th>");
		$('#dispatchContent').append("<th style='text-align:center'>回复时间</th>");
		$('#dispatchContent').append("<th style='text-align:center'>计划上课时间</th>");
		$('#dispatchContent').append("<th style='text-align:center'>抢单结果</th>");
		$('#dispatchContent').append("</tr></thead>");
		$.each(content,function(key,value){
			$('#dispatchContent').append("<tr>");
			$('#dispatchContent').append("<td style='text-align:center'>"+value.teacherInfo.nickname+"</td>");
			$('#dispatchContent').append("<td style='text-align:center'>"+value.dispatchTime+"</td>");
			$('#dispatchContent').append("<td style='text-align:center'>"+value.replyTime+"</td>");
			$('#dispatchContent').append("<td style='text-align:center'>"+value.planTime+"</td>");
			$('#dispatchContent').append("<td style='text-align:center'>"+value.result+"</td>");
			$('#dispatchContent').append("</tr>");
		});
		$('#dispatchContent').append("</table>");
		$('#myModal').modal({
          keyboard: true
        });
	});
}