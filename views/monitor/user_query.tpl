<div style="margin:0px 5px 0px 5px;">
   <div class="row">
	   <div class="col-md-2" style="text-align:center;">
	       <ul class="list-unstyled" style="line-height:50px;">
			  <li>
		        <a id="onlineUsersLink" class="btn btn-default" href="/monitor/online/user">在线用户</a>
			  </li>
			  <li>
		        <a id="onlineUsersLink" class="btn btn-default" href="/monitor/online/teacher">在线导师</a>
			  </li>
			  <li>
		        <a id="availableTeachersLink" class="btn btn-default" href="/monitor/live/teacher">可接单导师</a>
			  </li>
			  <li>
		        <a id="availableTeachersLink" class="btn btn-default active" href="/monitor/user/query">用户查询</a>
			  </li>
			</ul>
	   </div>
	   <div class="col-md-10">
	      <table class="table table-striped table-bordered table-hover">
		       <thead>
		          <tr>
		            <th style="text-align:center">用户Id</th>
					<th style="text-align:center">昵称</th>
					<th style="text-align:center">Phone</th>
					<th style="text-align:center">性别</th>
					<th style="text-align:center">登陆时间</th>
					<th style="text-align:center">身份</th>
					<th style="text-align:center">当前锁定状态</th>
					<th style="text-align:center">余额(元)</th>
		          </tr>
		   </thead>
		   <tbody>
			   {{range .data}}
			      <tr>
				     <td style="text-align:center">
					    {{.UserId}}
					 </td>
				     <td style="text-align:center">
					    {{.Nickname}}
					 </td>
					<td style="text-align:center">
					    {{.Phone}}
					 </td>
					<td style="text-align:center">
					  {{if eq .Gender 0}}
					      女
					   {{else}}
					      男
					   {{end}}
					</td>
					<td style="text-align:center">
					    {{dateformat .LastLoginTime "2006-01-02 15:04:05"}}
					 </td>
					<td style="text-align:center">
					   {{if eq .AccessRight 3}}
					      学生
					   {{else}}
					      导师
					   {{end}}
					</td>
					<td style="text-align:center">
					   {{.Locked | lockStatusStr}}
					</td>
					<td style="text-align:center">
					   {{.Balance | balance}}
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