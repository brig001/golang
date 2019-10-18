package main

import (
	"log"
	"realty/crawldata"
	"realty/module"
	"time"
)

func crawl() {
	//上海链家总数据
	var shanghaidata *crawldata.Lianjiadata
	shanghaidata = crawldata.Fetch()
	log.Println("shanghaidata： ", shanghaidata)
	module.Collectdata(shanghaidata)

	//京东拍卖数据
	var jingdong *crawldata.JingDongAuction
	var err error
	jingdong, err = crawldata.Fetch_JingDongAuction()
	if err == nil {
		log.Println("jingdong:", jingdong)
	}

	//淘宝拍卖数据
	var taobaodata *crawldata.TaobaoAuction
	var taobaoerr error
	taobaodata, taobaoerr = crawldata.FetchTaobao_Auction()
	if taobaoerr == nil {
		log.Println("taobaodata:", taobaodata)
	}

	if (taobaodata != nil) && (jingdong != nil) {
		module.CollectTaobaoAuctiondata(taobaodata, jingdong)
	}

	// 我爱我家数据
	var wawjdata *crawldata.WoAiWoJiaMarketData
	wawjdata, err = crawldata.FetchWAWJData()

	if wawjdata != nil {
		module.CollectWAWJdata(wawjdata)
	}
}

func doCrawlTimer() {
	t1 := time.NewTimer(time.Second * 60)
	for {
		select {
		case <-t1.C:
			// year, mon, day = now.Date()
			// hour, min, sec := time.Now().Clock()
			log.Println("0001")
			hour, min, _ := time.Now().Clock()
			if hour == 16 {
				if min == 30 {
					log.Println("crawl()...")
					crawl()
				}
			}
			t1.Reset(time.Second * 60)
		}
	}
}

// func jdData() {
// 	client := &http.Client{}
// 	req, err := http.NewRequest("POST", "http://www.01happy.com/demo/accept.php", strings.NewReader("name=cjb"))
// 	if err != nil {
// 	}
// 	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
// 	req.Header.Set("Cookie", "name=anny")
// 	resp, err := client.Do(req)
// 	defer resp.Body.Close()
// 	body, err := ioutil.ReadAll(resp.Body)
// 	if err != nil {
// 	}
// 	fmt.Println(string(body))
// }

func main() {
	crawl()
	doCrawlTimer()
}
