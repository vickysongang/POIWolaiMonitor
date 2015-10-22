<div style="margin:0px 5px 0px 5px;">
   <div class="row">
	   <div class="col-md-2" style="text-align:center;">
	        <ul class="list-unstyled" style="line-height:50px;">
			  <li>
		        <a class="btn btn-default" href="/monitor/order" style="width:110px;">订单实时状态</a>
			  </li>
			  <li>
		        <a  class="btn btn-default active" href="/monitor/order/query" style="width:110px;">订单查询</a>
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
						<th style="text-align:center">创建时间</th>
						<th style="text-align:center">预计上课时间</th>
						<th style="text-align:center">时长（分钟）</th>
						<th style="text-align:center">学生支付单价（元）</th>
						<th style="text-align:center">学生收取单价（元）</th>
			          </tr>
			   </thead>
			    <tbody>
				   {{range .data}}
				      <tr>
					     <td style="text-align:center">
							 <a href="javascript:showModal({{.Id}})">{{.Id}}</a>
						 </td>
						 <td style="text-align:center">
						   {{.Creator.Nickname}} ({{.Creator.UserId}})
						 </td>
						 <td style="text-align:center">
						    {{.Status}}
						 </td>
						 <td style="text-align:center">
						    {{.OrderType}}
						 </td>
					     <td style="text-align:center">
						    {{dateformat .CreateTime "2006-01-02 15:04:05"}}
						 </td>
						<td style="text-align:center">
						    {{.Date | parseOrderDate}}
						 </td>
						<td style="text-align:center">
						    {{.Length}}
						 </td>
						<td style="text-align:center">
						    {{.PricePerHour | calcPrice}}
						 </td>
						<td style="text-align:center">
						    {{.RealPricePerHour | calcPrice}}
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
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">
							订单分发记录
						</h4>
						</div>
						<div class="modal-body">
							<span id="dispatchContent"></span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
	   </div>
   </div>
</div>