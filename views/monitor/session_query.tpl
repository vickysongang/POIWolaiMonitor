<div style="margin:0px 5px 0px 5px;">
   <div class="row">
	   <div class="col-md-2" style="text-align:center;">
	        <ul class="list-unstyled" style="line-height:50px;">
			  <li>
		        <a class="btn btn-default" href="/monitor/session" style="width:110px;">课程实时状态</a>
			  </li>
			  <li>
		        <a  class="btn btn-default active" href="/monitor/session/query" style="width:110px;">课程查询</a>
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
						<th style="text-align:center">状态</th>
			          </tr>
			   </thead>
			    <tbody>
				    {{range .data}}
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
					  </tr>
				   {{end}}
			    </tbody>  
		  </table>
	      <div style="text-align:center;padding-left: 100px;margin-top: -24px;float: right;" class="pagination">
					{{if .paginator}}
						{{if gt .paginator.PageNums 1}}
					<ul class="pagination pagination-sm">
						{{if .paginator.HasPrev}}
						<li>
							<a href="{{.paginator.PageLinkFirst}}">首页</a>
						</li>
						<li>
							<a href="{{.paginator.PageLinkPrev}}">上一页</a>
						</li>
						{{else}}
						<li class="disabled">
							<a>首页</a>
						</li>
						<li class="disabled">
							<a>上一页</a>
						</li>
						{{end}}
							{{range $index, $page := .paginator.Pages}}
						<li{{if $.paginator.IsActive .}} class="active"{{end}}>
							<a href="{{$.paginator.PageLink $page}}">{{$page}}</a>
						</li>
						{{end}}
							{{if .paginator.HasNext}}
						<li>
							<a href="{{.paginator.PageLinkNext}}">下一页</a>
						</li>
						<li>
							<a href="{{.paginator.PageLinkLast}}">末页</a>
						</li>
						{{else}}
						<li class="disabled">
							<a>下一页</a>
						</li>
						<li class="disabled">
							<a>末页</a>
						</li>
						{{end}}
						<li class="disabled">
							<a>
								共{{.paginator.Nums }}条数据 每页{{.paginator.PerPageNums}}条 当前{{.paginator.Page}}/{{.paginator.PageNums}}页
							</a>
						</li>
						<li>
							<input type="text" id="tiaozhuan" placeholder="跳转页" style="width: 47px;height: 30px;border: 1px solid #dddddd;border-left: 0px;border-radius: 0px 4px 4px 0px;text-align: center;"></li>
					</ul>
					{{end}} 
				{{end}}
			</div>
	   </div>
   </div>
</div>