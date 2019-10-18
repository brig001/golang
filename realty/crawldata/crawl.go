package crawldata

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"
	"strings"
	// "strings"

	"github.com/PuerkitoBio/goquery"
)

func findDocumentSelection(doc *goquery.Document, jquerystr string) *goquery.Selection {
	var selection *goquery.Selection
	selection = doc.Find(jquerystr)
	if selection != nil {
		return selection
	} else {
		return nil
	}
}

//通过jqerystr 获取html上的数据
func getdata(doc *goquery.Document, jquerystr string) string {
	if doc != nil {
		selection := findDocumentSelection(doc, jquerystr)
		if selection != nil {
			return selection.Text()
		} else {
			return ""
		}
	} else {
		return ""
	}
}

func getdataHtml(doc *goquery.Document, jquerystr string) string {
	if doc != nil {
		selection := findDocumentSelection(doc, jquerystr)
		if selection != nil {
			data, _:= selection.Html()
			return data
		} else {
			return ""
		}
	} else {
		return ""
	}
}

// 上海链家真实在售二手房 58961 套上海链家真实租房 35118 套上海链家在售新房楼盘 281 个
func gethouses(housestr string) (housenum, rentingnum, buildingnum string) {
	var datastrlist []string
	datastrlist = strings.Split(housestr, " ")
	for i := 0; i < len(datastrlist); i++ {
		fmt.Println(datastrlist[i])
	}
	housenum = datastrlist[1]
	rentingnum = datastrlist[3]
	buildingnum = datastrlist[5]
	return
}

func Fetch() *Lianjiadata {
	var shanghai_data *Lianjiadata
	shanghai_data = new(Lianjiadata)
	shanghai_data.City = Shanghai

	// 获取二手房总量
	url := "https://sh.lianjia.com/"
	//========html 样式 begin=====================================
	// <div class="house-num">
	//  <ul>
	// 	<li>上海链家真实在售二手房 72858 套</li>
	// 	<li>上海链家真实租房 18452 套</li>
	// 	<li>上海链家在售新房楼盘 486 个</li>
	//  </ul>
	// </div>
	//========html 样式 end=====================================

	doc, err := goquery.NewDocument(url)
	if err == nil {
		housenumstr := getdata(doc, "div.house-num li")
		housenum, rentingnum, Properties := gethouses(housenumstr)
		shanghai_data.Houses = housenum
		shanghai_data.HouseForRent = rentingnum
		shanghai_data.PropertiesSale = Properties
	}

	//===上海经纪人数量=========================
	url = "https://sh.lianjia.com/jingjiren/"
	doc, err = goquery.NewDocument(url)
	if err == nil {
		data_jquery_str := "div.main-box div.con-box div.list-head h2 span"
		shanghai_data.Agent_nums = getdata(doc, data_jquery_str)
		shanghai_data.City = Shanghai
	}

	//==上海在售，待售楼盘
	url = "https://sh.fang.lianjia.com/loupan/jingan-xuhui-huangpu-changning-putuo-pudong-baoshan-zhabei-hongkou-yangpu-minhang-jiading-songjiang-qingpu-fengxian-jinshan/nho0nho1nho2nho3nho4nho5nht1nht2nhs1nhs3pg1/#jinshan"
	doc, err = goquery.NewDocument(url)
	if err == nil {
		//========html 样式 begin=====================================
		// 	<div class="resblock-have-find">
		// 	<span>为您找到</span>
		// 	<span class="value">21</span>
		// 	<span>个上海新房</span>
		// </div>
		//========html 样式 end=====================================

		data_jquery_str := "div.resblock-have-find span.value"
		selectnode := findDocumentSelection(doc, data_jquery_str)
		if selectnode != nil {
			htmlstr, err := selectnode.Html()
			if err != nil {
				fmt.Println("11111selectnode err:", err.Error())
			}
			fmt.Println("999888 selectnode.Html():", htmlstr)
			fmt.Println(selectnode.Text)
		} else {
			fmt.Println(".....................................................not find node")
		}

		shanghai_data.PropertiesSale = getdata(doc, data_jquery_str)
		// fmt.Println(" 0999999999999999999999999999 buildingnum:", shanghai_data.PropertiesSale)
	} else {
		fmt.Println("a4f65as4f56asd4f6as4f6asd4f6")
	}

	return shanghai_data
}

func FetchTaobao_Auction() (*TaobaoAuction, error) {
	var data *TaobaoAuction
	data = new(TaobaoAuction)

	url := "https://sf.taobao.com/list/50025969__1_1_%C9%CF%BA%A3.htm?spm=a213w.7398504.pagination.2.SKMs5s&auction_start_seg=-1&page=1"
	doc, err := goquery.NewDocument(url)
	if err != nil {
		log.Println(err)
		return nil, err
	}
	// timestr := "时间:" + time.Now().Format("2006-01-02 15:04:05")
	var houseNumSelection *goquery.Selection

	houseNumSelection = doc.Find("div.sf-scroll-fixed ul li.block em.count")
	if houseNumSelection != nil {
		// log.Println(houseNumSelection.Html())
		data.City = Shanghai
		data.Num = houseNumSelection.Text()
		houseNumStr := " 合计:" + houseNumSelection.Text()
		log.Println("淘宝拍卖上海房屋:", houseNumStr)
	}
	return data, nil
}

func Fetch_JingDongAuction() (*JingDongAuction, error) {
	url := "https://auction.jd.com/getJudicatureList.html?callback=jQuery3878271&page=1&limit=40&childrenCateId=12728&provinceId=2&paimaiStatus=0&_=1530777223410"
	client := &http.Client{}
	reqest, _ := http.NewRequest("GET", url, nil)
	response, _ := client.Do(reqest)
	if response.StatusCode != 200 {
		err := errors.New("response.StatusCode:" + fmt.Sprintf("%d", response.StatusCode))
		return nil, err
	}

	body, _ := ioutil.ReadAll(response.Body)
	bodystr := string(body)

	firstBracketsIndex := strings.IndexRune(bodystr, '(')

	bodystr = Substr(bodystr, firstBracketsIndex+1, len(bodystr)-firstBracketsIndex-2)
	bodystr = strings.Replace(bodystr, ")", "", -1)
	// fmt.Println(bodystr)
	//=================================================

	var data jingdongData
	var err error

	// err = json.NewDecoder([]byte(bodystr)).Decode(&data)
	err = json.Unmarshal([]byte(bodystr), &data)
	if err != nil {
		fmt.Println("json格式错误, 错误信息:" + err.Error())
		return nil, err
	}
	fmt.Println("00001data:", data)
	var jdAuction JingDongAuction
	jdAuction.Num = strconv.Itoa(data.Total)

	return &jdAuction, nil
}

//截取字符串 start 起点下标 length 需要截取的长度
func Substr(str string, start int, length int) string {
	rs := []rune(str)
	rl := len(rs)
	end := 0

	if start < 0 {
		start = rl - 1 + start
	}
	end = start + length

	if start > end {
		start, end = end, start
	}

	if start < 0 {
		start = 0
	}
	if start > rl {
		start = rl
	}
	if end < 0 {
		end = 0
	}
	if end > rl {
		end = rl
	}

	return string(rs[start:end])
}

