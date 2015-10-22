// POISessions
package models

import (
	"POIWolaiWebService/utils"
	"time"

	"github.com/astaxie/beego/orm"
	"github.com/cihub/seelog"
)

type POISession struct {
	Id         int64     `json:"id" orm:"pk"`
	OrderId    int64     `json:"orderId"`
	Creator    *POIUser  `json:"creatorInfo" orm:"-"`
	Teacher    *POIUser  `json:"teacherInfo" orm:"-"`
	PlanTime   string    `json:"planTime"`
	Length     int64     `json:"length"`
	Status     string    `json:"status"`
	Rating     int64     `json:"rating"`
	Comment    string    `json:"comment"`
	Created    int64     `json:"-" orm:"column(creator)"`
	Tutor      int64     `json:"-"`
	CreateTime time.Time `json:"-" orm:"auto_now_add;type(datetime)"`
	TimeFrom   time.Time `json:"-"`
	TimeTo     time.Time `json:"-"`
	Serving    bool      `json:"-" orm:"-"`
}

type POISessions []*POISession

type POIMonitorSession struct {
	SessionId     int64
	TimeStamp     int64
	ServingStatus bool
}

type POIMonitorSessions []POIMonitorSession

func (session *POISession) TableName() string {
	return "sessions"
}

func init() {
	orm.RegisterModel(new(POISession))
}

func QuerySessionById(sessionId int64) *POISession {
	o := orm.NewOrm()
	qb, _ := orm.NewQueryBuilder(utils.DB_TYPE)
	qb.Select("id,order_id, creator, tutor,create_time, plan_time, length, status, rating, comment, time_from, time_to").
		From("sessions").Where("id = ?")
	sql := qb.String()
	session := POISession{}
	err := o.Raw(sql, sessionId).QueryRow(&session)
	if err != nil {
		seelog.Error("sessionId:", sessionId, " ", err.Error())
		return nil
	}
	session.Creator = QueryUserById(session.Created)
	session.Teacher = QueryUserById(session.Tutor)
	return &session
}

func QuerySessions(start, pageCount int) POISessions {
	o := orm.NewOrm()
	qb, _ := orm.NewQueryBuilder(utils.DB_TYPE)
	qb.Select("id,order_id, creator, tutor,create_time ,plan_time, length, status, rating, comment, time_from, time_to").
		From("sessions").OrderBy("id").Desc().Limit(pageCount).Offset(start)
	sql := qb.String()
	sessions := make(POISessions, 0)
	_, err := o.Raw(sql).QueryRows(&sessions)
	if err != nil {
		return nil
	}
	for _, session := range sessions {
		session.Creator = QueryUserById(session.Created)
		session.Teacher = QueryUserById(session.Tutor)
	}
	return sessions
}

func GetSessionsCount() int64 {
	o := orm.NewOrm()
	count, _ := o.QueryTable("sessions").Count()
	return count
}
