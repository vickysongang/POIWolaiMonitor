<div style="margin:0px 5px 0px 5px;">
   <div class="row">
	   <div class="col-md-2" style="text-align:center;">
	        <ul class="list-unstyled" style="line-height:50px;">
			  <li>
		        <a class="btn btn-default active" href="/monitor/session" style="width:110px;">课程实时状态</a>
			  </li>
			  <li>
		        <a  class="btn btn-default" href="/monitor/session/query" style="width:110px;">课程查询</a>
			  </li>
			</ul>
	   </div>
	   <div class="col-md-10">
	      <table class="table table-striped table-bordered table-hover">
		       <thead>
			          <tr>
			            <th style="text-align:center">课程ID</th>
						<th style="text-align:center">订单ID</th>
						<th style="text-align:center">学生</th>
						<th style="text-align:center">老师</th>
						<th style="text-align:center">创建时间</th>
						<th style="text-align:center">预计上课时间</th>
						<th style="text-align:center">开始时间</th>
						<th style="text-align:center">结束时间</th>
						<th style="text-align:center">时长(s)</th>
						<th style="text-align:center">课程状态</th>
						<th style="text-align:center">是否正在上课中</th>
			          </tr>
			   </thead>
			    <tbody>
				    {{range .liveSessions}}
				      <tr>
					     <td style="text-align:center">
						    {{.Id}}
						 </td>
						 <td style="text-align:center">
						    {{.OrderId}}
						 </td>
						 <td style="text-align:center">
						    {{.Creator.Nickname}}({{.Creator.UserId}})
						 </td>
						 <td style="text-align:center">
						    {{.Teacher.Nickname}}({{.Teacher.UserId}})
						 </td>
					     <td style="text-align:center">
						    {{dateformat .CreateTime "2006-01-02 15:04:05"}}
						 </td>
						<td style="text-align:center">
						    {{.PlanTime | parseOrderDate}}
						 </td>
						<td style="text-align:center">
						    {{dateformat .TimeFrom "2006-01-02 15:04:05"}}
						 </td>
						<td style="text-align:center">
						    {{dateformat .TimeTo "2006-01-02 15:04:05"}}
						 </td>
						<td style="text-align:center">
						    {{.Length}}
						 </td>
						<td style="text-align:center">
						    {{.Status}}
						 </td>
						<td style="text-align:center">
						    {{.Serving}}
						 </td>
					  </tr>
				   {{end}}
			    </tbody>  
		  </table>
	   </div>
	</div>
</div>