// POIResponse
package models

type POIMonitorUserResponse struct {
	ErrCode int64
	ErrMsg  string
	Content POIMonitorUsers
}

type POIMonitorOrderResponse struct {
	ErrCode int64
	ErrMsg  string
	Content POIMonitorOrders
}

type POIMonitorSessionResponse struct {
	ErrCode int64
	ErrMsg  string
	Content POIMonitorSessions
}
