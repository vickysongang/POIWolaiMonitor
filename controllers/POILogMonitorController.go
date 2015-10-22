// LogMonitorController
package controllers

import (
	"bufio"
	"fmt"
	"io"
	"os/exec"
	"strings"
	"time"

	"github.com/astaxie/beego"
)

type POILogMonitorController struct {
	beego.Controller
}

func SearchLogByCond(dateFrom, dateTo, level, keywords string) string {
	//	commandStr := `awk '{t=$1" "$2;l=$3; if(t>="2015-09-17 11:12:00" && t<"2015-09-20 01:20:00" && l=="[Info]") print}' /Users/songang/Documents/POIWolaiWebService.log`
	logPath := beego.AppConfig.String("log_path")
	var commandStr string
	if level == "All" {
		if len(keywords) > 0 {
			commandStr = `awk '{t=$1" "$2; if(t>="` + dateFrom + `" && t<="` + dateTo + `") print}' ` + logPath + ` | grep ` + keywords + ``
		} else {
			commandStr = `awk '{t=$1" "$2; if(t>="` + dateFrom + `" && t<="` + dateTo + `") print}' ` + logPath + ``
		}
	} else {
		if len(keywords) > 0 {
			commandStr = `awk '{t=$1" "$2;l=$3; if(t>="` + dateFrom + `" && t<="` + dateTo + `" && l=="[` + level + `]") print}' ` + logPath + ` | grep ` + keywords + ``
		} else {
			commandStr = `awk '{t=$1" "$2;l=$3; if(t>="` + dateFrom + `" && t<="` + dateTo + `" && l=="[` + level + `]") print}' ` + logPath + ``
		}
	}
	fmt.Println(commandStr)
	cmd := exec.Command("/bin/sh", "-c", commandStr)
	//	output, err := cmd.Output()
	//	if err != nil {
	//		fmt.Println(err.Error())
	//		return err.Error()
	//	}
	stdout, _ := cmd.StdoutPipe()
	cmd.Start()
	reader := bufio.NewReader(stdout)
	var output string
	for {
		line, err := reader.ReadBytes('\n')
		lineStr := string(line)
		lineSlice := strings.Split(lineStr, " ")
		var displayLine string
		if len(lineSlice) > 5 {
			str0 := "<span class=\"text-danger\">" + lineSlice[0] + "</span>"
			str1 := "<span class=\"text-danger\">" + lineSlice[1] + "</span>"
			str2 := "<span class=\"text-info\">" + lineSlice[2] + "</span>"
			str3 := lineSlice[3]
			str4 := lineSlice[4]
			var mainStr string
			for k := 5; k < len(lineSlice); k++ {
				mainStr = mainStr + " " + lineSlice[k]
			}
			displayLine = str0 + " " + str1 + " " + str2 + " " + str3 + " " + str4 + " " + mainStr

		} else {
			displayLine = lineStr
		}

		if err == io.EOF {
			break
		}
		output = output + "</br>" + displayLine
	}
	cmd.Wait()
	if len(output) == 0 {
		output = "No data display."
	}
	return output
}

func (c *POILogMonitorController) InitLogPage() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/log_monitor.tpl"
	nowStr := time.Now().Format("2006-01-02")
	defaultTime := fmt.Sprintf("%s %s - %s %s", nowStr, "00:00:00", nowStr, "23:59:59")
	c.Data["defaultTime"] = defaultTime
	c.Data["type"] = "log"
}

func (c *POILogMonitorController) SearchLog() {
	c.Layout = "layout/layout_monitor.tpl"
	c.TplNames = "monitor/log_monitor.tpl"
	dateStr := c.Input().Get("date")
	level := c.Input().Get("level")
	keywords := c.Input().Get("keywords")
	dates := strings.Split(dateStr, " - ")
	dateFrom := dates[0]
	dateTo := dates[1]
	c.Data["type"] = "log"
	content := SearchLogByCond(dateFrom, dateTo, level, keywords)
	c.Ctx.WriteString(content)
}
