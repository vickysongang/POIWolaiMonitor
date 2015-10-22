package routers

import (
	"POIWolaiMonitor/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/monitor/online/user", &controllers.POIUserMonitorController{}, "*:GetOnlineUsers")
	beego.Router("/monitor/online/teacher", &controllers.POIUserMonitorController{}, "*:GetOnlineTeachers")
	beego.Router("/monitor/live/teacher", &controllers.POIUserMonitorController{}, "*:GetAvailableTeachers")
	beego.Router("/monitor/user/query", &controllers.POIUserMonitorController{}, "*:QueryUsers")
	beego.Router("/monitor/order", &controllers.POIOrderMonitorController{}, "*:OrderMonitor")
	beego.Router("/monitor/order/query", &controllers.POIOrderMonitorController{}, "*:OrderQuery")
	beego.Router("/monitor/order/dispatch", &controllers.POIOrderMonitorController{}, "*:GetOrderDispatch")
	beego.Router("/monitor/session", &controllers.POISessionMonitorController{}, "*:SessionMonitor")
	beego.Router("/monitor/session/query", &controllers.POISessionMonitorController{}, "*:SessionQuery")
	beego.Router("/monitor/log", &controllers.POILogMonitorController{}, "*:InitLogPage")
	beego.Router("/monitor/log/search", &controllers.POILogMonitorController{}, "post:SearchLog")
}
