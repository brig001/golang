package crawldata

//京东拍卖数据
type JingDongAuction struct {
	Num string //上海今日即将开始拍卖的房子
}

type jingdongData struct {
	Total int `json:"total"` // 合计
}
