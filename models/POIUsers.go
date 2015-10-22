// POIUser
package models

import (
	"time"

	"POIWolaiMonitor/libs"

	"github.com/astaxie/beego/orm"
)

type POIMonitorUser struct {
	User      *POIUser `json:"userInfo"`
	LoginTime int64
	Locked    bool
}

type POIMonitorUsers struct {
	OnlineUsers    []POIMonitorUser
	OnlineTeachers []POIMonitorUser
	LiveUsers      []POIMonitorUser
	LiveTeachers   []POIMonitorUser
}

type POIUser struct {
	UserId        int64     `json:"userId" orm:"pk;column(id)"`
	Nickname      string    `json:"nickname"`
	Avatar        string    `json:"avatar"`
	Gender        int64     `json:"gender"`
	AccessRight   int64     `json:"accessRight"`
	LastLoginTime time.Time `json:"-" orm:auto_add;type(datetime)`
	Phone         string    `json:"phone"`
	Status        int64     `json:"-"`
	Balance       int64     `json:"-"`
	Locked        bool      `orm:"-"`
}

type POIUsers []*POIUser

func (user *POIUser) TableName() string {
	return "users"
}

func init() {
	orm.RegisterModel(new(POIUser))
}

func QueryUserById(userId int64) *POIUser {
	var user *POIUser
	qb, _ := orm.NewQueryBuilder(libs.GetDBDriverName())
	qb.Select("id,nickname,avatar,gender,access_right,status,balance,phone,last_login_time").From("users").Where("id = ?")
	sql := qb.String()
	o := orm.NewOrm()
	err := o.Raw(sql, userId).QueryRow(&user)
	if err != nil {
		return nil
	}
	return user
}

func QueryUsers(start, pageCount int) POIUsers {
	users := make(POIUsers, 0)
	qb, _ := orm.NewQueryBuilder(libs.GetDBDriverName())
	qb.Select("id,nickname,avatar,gender,access_right,status,balance,phone,last_login_time").
		From("users").OrderBy("id").Desc().Limit(pageCount).Offset(start)
	sql := qb.String()
	o := orm.NewOrm()
	_, err := o.Raw(sql).QueryRows(&users)
	if err != nil {
		return nil
	}
	return users
}

func GetUsersCount() int64 {
	o := orm.NewOrm()
	count, _ := o.QueryTable("users").Count()
	return count
}
