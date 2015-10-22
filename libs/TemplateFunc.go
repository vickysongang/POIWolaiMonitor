package libs

import (
	"time"

	"github.com/astaxie/beego"
)

func AddFuncMap() {
	beego.AddFuncMap("balance", ParseBalance)
	beego.AddFuncMap("checkstr", CheckStr)
	beego.AddFuncMap("lockStatusStr", LockStatusStr)
	beego.AddFuncMap("calcPrice", CalcPrice)
	beego.AddFuncMap("parseOrderDate", ParseOrderDate)
}

func ParseBalance(in int64) (out int64) {
	out = in / 100
	return
}

func CheckStr(in1 string, in2 string) bool {
	return in1 == in2
}

func LockStatusStr(locked bool) string {
	if locked {
		return "已锁定"
	}
	return "未锁定"
}

func CalcPrice(price int64) int64 {
	return price / 100
}

func ParseOrderDate(date string) string {
	t, _ := time.Parse(time.RFC3339, date)
	return t.Format("2006-01-02 15:04:05")
}
