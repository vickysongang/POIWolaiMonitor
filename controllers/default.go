package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "index.tpl"
	c.Data["type"] = "index"
}
