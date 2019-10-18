package test

import (
	// "fmt"
	// "labix.org/v2/mgo/bson"
	// "gopkg.in/mgo.v2/bson"
	"realty/crawldata"
	"realty/module"
	"testing"
)

func Test_Insertjiadata(t *testing.T) {
	var (
		shanghaidata *crawldata.Lianjiadata
	)
	shanghaidata = new(crawldata.Lianjiadata)
	shanghaidata.City = 1
	shanghaidata.Agent_nums = "20004591"
	shanghaidata.Buy_90 = "8388"
	shanghaidata.HouseForRent = "40410"
	shanghaidata.Houses = "87211"
	shanghaidata.Yesterday_look = "7237"

	module.InitDB()
	defer module.CloseDB()

	module.Insert(shanghaidata)
}

func Test_fetchlianjiadata(t *testing.T) {
	var (
		shanghaidata *crawldata.Lianjiadata
	)
	shanghaidata = new(crawldata.Lianjiadata)
	shanghaidata.City = 1
	shanghaidata.Agent_nums = "73548"
	shanghaidata.Buy_90 = "5842"
	shanghaidata.HouseForRent = "40410"
	shanghaidata.Houses = "87211"
	shanghaidata.Yesterday_look = "7237"

	module.Collectdata(shanghaidata)
}

func Test_fetchtaobao(t *testing.T) {
	var (
		taobaoauction *crawldata.TaobaoAuction
	)
	taobaoauction = new(crawldata.TaobaoAuction)
	taobaoauction.City = 1
	taobaoauction.Num = "20004591"
	module.CollectTaobaoAuctiondata(taobaoauction)
}
