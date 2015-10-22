// SessionMonitorController
package controllers

import (
	"POIWolaiMonitor/libs"
	"POIWolaiMonitor/models"
	"encoding/json"

	"github.com/astaxie/beego"
	page "github.com/astaxie/beego/utils/pagination"
)

type POISessionMonitorController struct {
	beego.Controller
}

func (c *POISessionMonitorController) SessionMonitor() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/session_monitor.tpl"
	resp := models.POIMonitorSessionResponse{}
	content, _ := libs.ParseGetRequest(libs.MONITOR_SESSION_URL, nil)

	json.Unmarshal([]byte(content), &resp)
	sessions := make(models.POISessions, 0)
	for i := range resp.Content {
		monitorSession := resp.Content[i]
		session := models.QuerySessionById(monitorSession.SessionId)
		session.Serving = monitorSession.ServingStatus
		sessions = append(sessions, session)
	}
	c.Data["liveSessions"] = sessions
	c.Data["type"] = "session"
}

func (c *POISessionMonitorController) SessionQuery() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/session_query.tpl"
	count := models.GetSessionsCount()
	if count > 0 {
		p := page.NewPaginator(c.Ctx.Request, 10, count)
		sessions := models.QuerySessions(p.Offset(), 10)
		c.Data["data"] = sessions
		c.Data["paginator"] = p
	}
	c.Data["type"] = "session"
}
