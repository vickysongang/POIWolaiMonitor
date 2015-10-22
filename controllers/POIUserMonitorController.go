// UserMonitorController
package controllers

import (
	"POIWolaiMonitor/libs"
	"POIWolaiMonitor/models"
	"encoding/json"

	"github.com/astaxie/beego"
	page "github.com/astaxie/beego/utils/pagination"
)

type POIUserMonitorController struct {
	beego.Controller
}

func (c *POIUserMonitorController) GetOnlineUsers() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/online_user.tpl"

	resp := models.POIMonitorUserResponse{}
	content, _ := libs.ParseGetRequest(libs.MONITOR_USER_URL, nil)
	json.Unmarshal([]byte(content), &resp)
	onlineUsers := make([]*models.POIUser, 0)
	for i := range resp.Content.OnlineUsers {
		userInfo := resp.Content.OnlineUsers[i]
		user := models.QueryUserById(userInfo.User.UserId)
		user.Locked = userInfo.Locked
		onlineUsers = append(onlineUsers, user)
	}
	c.Data["onlineUsers"] = onlineUsers
	c.Data["type"] = "user"
}

func (c *POIUserMonitorController) GetOnlineTeachers() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/online_teacher.tpl"

	resp := models.POIMonitorUserResponse{}
	content, _ := libs.ParseGetRequest(libs.MONITOR_USER_URL, nil)
	json.Unmarshal([]byte(content), &resp)
	onlineTeachers := make([]*models.POIUser, 0)
	for i := range resp.Content.OnlineTeachers {
		userInfo := resp.Content.OnlineTeachers[i]
		user := models.QueryUserById(userInfo.User.UserId)
		user.Locked = userInfo.Locked
		onlineTeachers = append(onlineTeachers, user)
	}
	c.Data["onlineTeachers"] = onlineTeachers
	c.Data["type"] = "user"
}

func (c *POIUserMonitorController) GetAvailableTeachers() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/live_teachers.tpl"

	resp := models.POIMonitorUserResponse{}
	content, _ := libs.ParseGetRequest(libs.MONITOR_USER_URL, nil)
	json.Unmarshal([]byte(content), &resp)
	availableTeachers := make([]*models.POIUser, 0)
	for i := range resp.Content.LiveTeachers {
		userInfo := resp.Content.LiveTeachers[i]
		user := models.QueryUserById(userInfo.User.UserId)
		user.Locked = userInfo.Locked
		availableTeachers = append(availableTeachers, user)
	}
	c.Data["availableTeachers"] = availableTeachers
	c.Data["type"] = "user"
}

func (c *POIUserMonitorController) QueryUsers() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/user_query.tpl"
	count := models.GetUsersCount()
	if count > 0 {
		p := page.NewPaginator(c.Ctx.Request, 10, count)
		users := models.QueryUsers(p.Offset(), 10)
		c.Data["data"] = users
		c.Data["paginator"] = p
	}
	c.Data["type"] = "user"
}
