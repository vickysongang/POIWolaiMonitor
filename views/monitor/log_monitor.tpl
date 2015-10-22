<div style="margin:0px 5px 0px 5px;" class="row">
	 <form class="form-inline">
	    <fieldset>
		  <div class="form-group col-md-4">
		    <div class="input-group">
		      <div class="input-group-addon">时间范围</div>
		       <input type="text"  name="reservation" value="{{.defaultTime}}" id="reservationtime" class="form-control"  class="span4"/>
		    </div>
		  </div>
		  <div class="form-group col-md-2">
		    <div class="input-group">
		      <div class="input-group-addon">日志级别</div>
			  <select class="form-control" id="loglevel">
				  <option>All</option>
				  <option>Debug</option>
				  <option>Info</option>
				  <option>Warn</option>
				  <option>Error</option>
				  <option>Critical</option>
			  </select>
		     </div>
		  </div>
		 <div class="form-group col-md-3">
		    <div class="input-group">
		        <div class="input-group-addon">关键词</div>
				<input type="text" class="form-control" placeholder="请输入查询关键词" id="keywords">
			</div>
		 </div>
		 <a class="btn btn-primary" href="javascript:searchLog()" >查询</a>
	   </fieldset>
	</form>
	<div style="margin-left:10px;margin-top:10px;">
	   <span id="logcontent"></span>
	</div>
</div>