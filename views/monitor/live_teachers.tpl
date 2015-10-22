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
		        <a id="availableTeachersLink" class="btn btn-default active" href="/monitor/live/teacher">可接单导师</a>
			  </li>
			  <li>
		        <a id="availableTeachersLink" class="btn btn-default" href="/monitor/user/query">用户查询</a>
			  </li>
			</ul>
	   </div>
	   <div class="col-md-10">
	     <table class="table table-striped table-bordered table-hover" style="display:inline-table;" id="availableTeachersTable">
		   <thead>
		          <tr>
		            <th style="text-align:center">用户Id</th>
					<th style="text-align:center">昵称</th>
					<th style="text-align:center">Phone</th>
					<th style="text-align:center">性别</th>
					<th style="text-align:center">最后登陆时间</th>
					<th style="text-align:center">余额(元)</th>
		          </tr>
		   </thead>
		   <tbody>
			   {{range .availableTeachers}}
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
					   {{.Balance | balance}}
					</td>
				  </tr>
			   {{end}}
	       </tbody>
	     <table>
		</div>
	</div>
</div>