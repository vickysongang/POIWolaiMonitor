package main

import (
	"POIWolaiMonitor/libs"
	_ "POIWolaiMonitor/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	//注册数据库
	err := orm.RegisterDataBase("default",
		beego.AppConfig.String("driver"),
		beego.AppConfig.String("username")+":"+
			beego.AppConfig.String("password")+"@"+
			beego.AppConfig.String("method")+"("+
			beego.AppConfig.String("address")+":"+
			beego.AppConfig.String("port")+")/"+
			beego.AppConfig.String("database")+
			"?charset=utf8&loc=Asia%2FShanghai", 30)
	if err != nil {
		panic(err)
	}
}

func main() {
	libs.AddFuncMap()
	beego.Run()
}
