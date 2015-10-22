<div style="margin:0px 5px 0px 5px;">
   <div class="row">
	   <div class="col-md-2" style="text-align:center;">
	        <ul class="list-unstyled" style="line-height:50px;">
			  <li>
		        <a class="btn btn-default active" href="/monitor/order" style="width:110px;">订单实时状态</a>
			  </li>
			  <li>
		        <a  class="btn btn-default" href="/monitor/order/query" style="width:110px;">订单查询</a>
			  </li>
			</ul>
	   </div>
	   <div class="col-md-10">
	      <table class="table table-striped table-bordered table-hover">
		       <thead>
			          <tr>
			            <th style="text-align:center">订单ID</th>
						<th style="text-align:center">订单创建者</th>
						<th style="text-align:center">订单状态</th>
						<th style="text-align:center">订单类型</th>
						<th style="text-align:center">接单老师信息</th>
			          </tr>
			   </thead>
			    <tbody>
				   {{range .dispatchOrders}}
				      <tr>
					     <td style="text-align:center">
						    {{.Id}}
						 </td>
						 <td style="text-align:center">
						    {{.Creator.Nickname}}({{.Creator.UserId}})
						 </td>
						 <td style="text-align:center">
						    {{.Status}}
						 </td>
						 <td style="text-align:center">
						    {{.OrderType}}
						 </td>
					     <td style="text-align:center">
						    {{.DispatchdTeachers}}
						 </td>
					  </tr>
				   {{end}}
		       </tbody>
		  </table>
	   </div>
   </div>
</div>