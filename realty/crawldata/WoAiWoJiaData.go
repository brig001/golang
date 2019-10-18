package crawldata

import (
	"strings"
	"github.com/PuerkitoBio/goquery"
	"fmt"
	"log"
)

//我爱我家市场数据
type WoAiWoJiaMarketData struct {
	Year            string
	Month           string
	PriceDeal       string //成交均价
	PriceSale       string //挂牌均价
	HouseDeal       string //成交套数
	HouseSale       string //挂牌套数
	NewCustomer     string //新增用户
	LookNum         string //带看数量
	Near7DayLookNum string //近7天带看数量
}



// https://sh.5i5j.com/fangjia/
// html 格式：
//<!-- 行情 -->
//<dl class="hqBox clear">
//<dd>
//<h2 class="hqTit">我爱我家成交均价（6月）</h2>
//<div class="priBox">
//<div class="price">
//<strong>55554</strong>
//<span>
//<i>
//</i>元
//<div class="i-tan" style="display: none">
//<div class="i-tan-con">
//<p>我爱我家成交数据，非全市场数据</p>
//</div>
//</div>
//</span>
//<em>4.84%
//<span class="green"></span></em>
//</div>
//<div class="priXiang">
//<span>挂牌均价：
//<strong>58866 元/㎡</strong></span>
//<em>0.06%
//<span class="red"></span></em>
//</div>
//</div>
//</dd>
//<dd>
//<h2 class="hqTit">我爱我家成交量（6月）</h2>
//<div class="priBox">
//<div class="price">
//<strong>590</strong>
//<span>
//<i>
//</i>套
//<div class="i-tan" style="display: none">
//<div class="i-tan-con">
//<p>我爱我家成交数据，非全市场数据</p>
//</div>
//</div>
//</span>
//<em>3.51%
//<span class="red"></span></em>
//</div>
//<div class="priXiang">
//<span>当前在售：
//<strong>62728 套</strong></span>
//</div>
//</div>
//</dd>
//<dd style="margin-right: 0px;">
//<h2 class="hqTit">我爱我家新增客户（6月）</h2>
//<div class="priBox">
//<div class="price">
//<strong>16789</strong>
//<span>
//<i>
//</i>人
//<div class="i-tan" style="display: none">
//<div class="i-tan-con">
//<p>我爱我家数据，非全市场数据</p>
//</div>
//</div>
//</span>
//<em>13.15%
//<span class="green"></span></em>
//</div>
//<div class="priXiang">
//<span>6月带看：
//<strong>62270次</strong></span>
//<em>2.31%
//<span class="green"></span></em>
//<span>近7天带看：
//<strong>10136次</strong></span>
//</div>
//</div>
//</dd>
//</dl>
//<!-- 行情 End-->


//func getwawjData(selectnode *goquery.Selection )

func FetchWAWJData() (*WoAiWoJiaMarketData, error) {

	var data *WoAiWoJiaMarketData
	data = new(WoAiWoJiaMarketData)

	url := "https://sh.5i5j.com/fangjia/"
	doc, err := goquery.NewDocument(url)
	fmt.Println("doc:", doc)
	if err != nil {
		log.Println(err)
		return nil, err
	}
	// func findDocumentSelection(doc *goquery.Document, jquerystr string) *goquery.Selection {
	// "dl.hqBox clear" clear 是别名
	basePricePath := "dl.hqBox "
	basePricePath = basePricePath +  " dd "



	//price Deal
	priceClassPath := basePricePath +  " div.price strong "
	data.PriceDeal = getdataHtml(doc, priceClassPath)
	//sale price
	salePriceClassPath := basePricePath +  " div.priXiang strong "
	data.PriceSale = getdataHtml(doc, salePriceClassPath)

	priceSelecttion := findDocumentSelection(doc, basePricePath)
	HouseSelecttion := priceSelecttion.Next()

	DealValue, SaleValue := getWAWJData(HouseSelecttion)
	data.HouseDeal = DealValue
	data.HouseSale = SaleValue

	newCustomerNode :=  HouseSelecttion.Next()
	//datastr,_ := newCustomerNode.Html()
	//fmt.Println(datastr)
	NewCustomerValue, LookNumValue := getWAWJData(newCustomerNode)
	data.NewCustomer = NewCustomerValue
	data.LookNum =  LookNumValue
	near7daylook, _ := newCustomerNode.Children().Next().Children().Next().Children().Next().Next().Children().Html()
	//fmt.Println("near7daylook:", near7daylook)
	data.Near7DayLookNum = near7daylook

	//fmt.Println("data:", data)
	filterWAWJData(data)
	fmt.Println("data2:", data)
	return data, nil
}

func filterWAWJData(data *WoAiWoJiaMarketData){
	data.PriceSale = strings.TrimSpace(strings.Replace(data.PriceSale, "元/㎡", "", -1))
	data.HouseSale = strings.TrimSpace(strings.Replace(data.HouseSale, "套", "", -1))
	data.LookNum = strings.Replace(data.LookNum, "次", "", -1)
	data.Near7DayLookNum = strings.Replace(data.Near7DayLookNum, "次", "", -1)
	return
}


func getWAWJData(selectnode *goquery.Selection)(DealValue, SaleValue string){
	DealValue, _ = selectnode.Children().Next().Children().Children().Html()
	SaleValue, _ = selectnode.Children().Next().Children().Next().Children().Children().Html()
	return
}
