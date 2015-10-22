<!DOCTYPE html>
<html lang="zh-CN">
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>POIMonitor</title>
		<link rel='icon' href='/static/img/defaultavatar.ico' type=‘image/x-ico’ /> 
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/static/css/daterangepicker-bs3.css">
		<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
   </head>
   <body>
     <div id="loading" style="display:none;">  
         Loading content, please wait..  
        <img src="/static/img/loading.gif" mce_src="loading.gif" alt="loading.." />  
     </div> 
      <div class="container-fluid">
	    <!--header section-->
		<nav class="navbar navbar-default">
		    <div class="navbar-header col-md-2">
		      <a class="navbar-brand" href="#"><img src='/static/img/defaultavatar.ico' style="height:18px;width:18px;"></img> POI监控平台</a>
		 </div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			    <ul class="nav navbar-nav" id="tab">
				   <li class="{{if checkstr .type "index"}}active{{end}}"><a href="/">首页</a></li>
                   <li class="{{if checkstr .type "user"}}active{{end}}"><a href="/monitor/online/user" id="userMonitor">用户监控</a></li>
				   <li class="{{if checkstr .type "order"}}active{{end}}"><a href="/monitor/order" id="orderMonitor">订单监控</a></li>
				   <li class="{{if checkstr .type "session"}}active{{end}}"><a href="/monitor/session" id="sessionMonitor">课程监控</a></li>
				   <li class="{{if checkstr .type "log"}}active{{end}}"><a href="/monitor/log" id="logMonitor">日志监控</a></li>
				</ul>
			</div>
		</nav>
		
		
        {{.LayoutContent}}
      </div>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="/static/js/monitor.js"></script>
	<script src="/static/js/moment.js"></script>
	<script src="/static/js/daterangepicker.js"></script>
   </body>
</html>