// POIUtils
package libs

import (
	"io/ioutil"
	"net/http"
	"net/url"
	"strings"

	"github.com/astaxie/beego"
)

const (
	PROTOCOL = "http"
)

func GetDBDriverName() string {
	return beego.AppConfig.String("driver")
}

func GetServerAddress() string {
	serverAddress := beego.AppConfig.String("server_address")
	if serverAddress == "" {
		serverAddress = "127.0.0.1"
	}
	return serverAddress
}

func ParseGetRequest(urlStr string, queryParams map[string]string) (string, error) {
	u, _ := url.Parse(PROTOCOL + "://" + GetServerAddress() + urlStr)
	q := u.Query()
	for k, v := range queryParams {
		q.Set(k, v)
	}
	u.RawQuery = q.Encode()
	res, err := http.Get(u.String())
	if err != nil {
		return "", err
	}
	defer res.Body.Close()
	result, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return "", nil
	}
	return string(result), nil
}

func ParsePostRequest(urlStr string, queryParams map[string]string) (string, error) {
	var err error
	vv := url.Values{}
	for k, v := range queryParams {
		vv.Set(k, v)
	}
	body := ioutil.NopCloser(strings.NewReader(vv.Encode()))
	req, err := http.NewRequest("POST", PROTOCOL+"://"+GetServerAddress()+urlStr, body)
	req.Header.Set("Content-Type", "application/x-www-form-urlencoded; param=value")
	if err != nil {
		return "", err
	}
	client := &http.Client{}
	res, err := client.Do(req)
	if err != nil {
		return "", err
	}
	defer res.Body.Close()
	result, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return "", nil
	}
	return string(result), nil
}
