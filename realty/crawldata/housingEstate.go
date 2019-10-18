package crawldata

import (
	"log"
	"time"
	// "strings"

	"github.com/PuerkitoBio/goquery"
)

type Enmu_SH_HousingEstate uint8

const (
	SHydjy   Enmu_SH_HousingEstate = 0  //嘉定安亭 郊环  润渡佳苑 http://sh.lianjia.com/ershoufang/q5011000013045s3
	SHhmy    Enmu_SH_HousingEstate = 1  //内环 花木苑  http://sh.lianjia.com/ershoufang/q5011000014042s3
	SHzylwc  Enmu_SH_HousingEstate = 2  //内环  中远两湾城 http://sh.lianjia.com/ershoufang/rs%E4%B8%AD%E8%BF%9C%E4%B8%A4%E6%B9%BE%E5%9F%8E
	SHpflc   Enmu_SH_HousingEstate = 3  //中环 浦发绿城 http://sh.lianjia.com/ershoufang/rs%E6%B5%A6%E5%8F%91%E7%BB%BF%E5%9F%8E
	SHmthc   Enmu_SH_HousingEstate = 4  //外环 明天华城 http://sh.lianjia.com/ershoufang/s3rs%E6%98%8E%E5%A4%A9%E5%8D%8E%E5%9F%8E
	SHjdzzc  Enmu_SH_HousingEstate = 5  //外环 金地自在城 http://sh.lianjia.com/ershoufang/q5011102207024s3
	SHshkc   Enmu_SH_HousingEstate = 6  //外环上海康城 http://sh.lianjia.com/ershoufang/rs%E4%B8%8A%E6%B5%B7%E5%BA%B7%E5%9F%8E
	SHfyjy   Enmu_SH_HousingEstate = 7  //外环 富友嘉园 http://sh.lianjia.com/ershoufang/q5011000013874s3
	SHjsxjc  Enmu_SH_HousingEstate = 8  //外环 金色西郊城 http://sh.lianjia.com/ershoufang/rs%E9%87%91%E8%89%B2%E8%A5%BF%E9%83%8A%E5%9F%8E
	SHldsjy  Enmu_SH_HousingEstate = 9  //外环 朗庭上郡苑(公寓) http://sh.lianjia.com/ershoufang/q5011000013054
	SHhqjy   Enmu_SH_HousingEstate = 10 //徐汇 中环 华沁家园 http://sh.lianjia.com/ershoufang/q5011000011265
	SHsmbjhy Enmu_SH_HousingEstate = 11 //陆家嘴 内环 世茂滨江花园 http://sh.lianjia.com/ershoufang/q5011000017872
	SHmdc    Enmu_SH_HousingEstate = 12 //长宁 古北 中环 名都城(公寓) http://sh.lianjia.com/ershoufang/q5011000018067
	SHylxy   Enmu_SH_HousingEstate = 13 //张江 中环 益丰新村 玉兰香苑 http://sh.lianjia.com/ershoufang/q5011000010254
	Hzthy    Enmu_SH_HousingEstate = 14 //浦东 航头 外环 海洲桃花园 // http://sh.lianjia.com/ershoufang/q5011000002676
	Pjbd     Enmu_SH_HousingEstate = 15 //浦东 外环 浦江 浦江宝邸 http://sh.lianjia.com/ershoufang/q5020026766287100
	lcxy     Enmu_SH_HousingEstate = 16 //绿川新苑
)

var HousingEstateURL = []string{
	"http://sh.lianjia.com/ershoufang/q5011000013045s3",  //嘉定安亭 郊环  润渡佳苑
	"http://sh.lianjia.com/ershoufang/q5011000014042s3",  //内环 花木苑
	"http://sh.lianjia.com/ershoufang/q5011000014141",    //内环  中远两湾城
	"http://sh.lianjia.com/ershoufang/q5011000013259",    //中环 浦发绿城
	"http://sh.lianjia.com/ershoufang/q5011000019949",    //外环 明天华城
	"http://sh.lianjia.com/ershoufang/q5011102207024",    //外环 金地自在城
	"http://sh.lianjia.com/ershoufang/q5011102207057",    //外环 上海康城
	"http://sh.lianjia.com/ershoufang/q5011000013874s3",  //外环 富友嘉园
	"http://sh.lianjia.com/ershoufang/q5011000017485",    //外环 金色西郊城
	"http://sh.lianjia.com/ershoufang/q5011000013054",    //外环 朗庭上郡苑(公寓)
	"http://sh.lianjia.com/ershoufang/q5011000011265",    //徐汇 中环 华沁家园
	"http://sh.lianjia.com/ershoufang/q5011000017872",    //陆家嘴 内环 世茂滨江花园
	"http://sh.lianjia.com/ershoufang/q5011000018067",    //长宁 古北 中环 名都城(公寓)
	"http://sh.lianjia.com/ershoufang/q5011000010254",    //张江 中环 益丰新村 玉兰香苑
	"http://sh.lianjia.com/ershoufang/q5011000002676",    //航头 海洲桃花园
	"http://sh.lianjia.com/ershoufang/q5020026766287100", //浦江镇 浦江宝邸
	"http://sh.lianjia.com/ershoufang/q5011000014388",    //绿川新苑
}

var HousingEstateName = []string{
	"润渡佳苑",      //嘉定安亭 郊环
	"花木苑",       //内环
	"中远两湾城",     //内环
	"浦发绿城",      //中环
	"明天华城",      //外环
	"金地自在城4",    //外环
	"上海康城",      //外环
	"富友嘉园",      //外环
	"金色西郊城",     //外环
	"朗庭上郡苑(公寓)", //外环
	"华沁家园",      //徐汇 中环
	"世茂滨江花园",    //陆家嘴 内环
	"名都城(公寓)",   //长宁 古北 中环
	"玉兰香苑",      //张江 中环
	"海洲桃花园",     //浦东 航头
	"浦江宝邸",      //浦东 浦江镇
	"绿川新苑",      //浦东北蔡
}

//链家数据2
type LianjiaHousingEstate struct {
	Name    string //小区名称
	Price   string //小区挂牌均价
	Solding string //正在出售中
	Buy_90  string //近90天成交
	Look_30 string //近30天带看
}

func FetchHousingEstateData() []*LianjiaHousingEstate {
	var datalist []*LianjiaHousingEstate
	datalist = make([]*LianjiaHousingEstate, len(HousingEstateURL))

	for i := 0; i < len(HousingEstateURL); i++ {
		time.Sleep(time.Second * time.Duration(1))
		data := FetchHousingEstate(HousingEstateName[i], HousingEstateURL[i])
		datalist[i] = data
	}
	return datalist
}

func FetchHousingEstate(name, url string) *LianjiaHousingEstate {
	var housingEstatedata LianjiaHousingEstate
	doc, err := goquery.NewDocument(url)
	if err == nil {

		//小区名 housingEstatedata.Name
		housingEstatedata.Name = name
		// 获取二手房总量
		housingEstatedata.Solding = getdata(doc, "div.search-result span")
		log.Println("housingEstatedata.Solding:", housingEstatedata.Solding)

		rightBarStr := "div.m-side-bar ul.content"
		//小区均价 housingEstatedata.Privce
		privcejsstr := rightBarStr + " li div span.strong-num"
		housingEstatedata.Price = getdata(doc, privcejsstr)
		log.Println("housingEstatedata.Privce:", housingEstatedata.Price)
		// //90天内成交房源
		over_house_90_day_str := rightBarStr + " li div.value span.num"
		housingEstatedata.Buy_90 = getdata(doc, over_house_90_day_str)
		log.Println("housingEstatedata.Buy_90:", housingEstatedata.Buy_90)
		// 30日带看
		day30numstr := rightBarStr + " li.last-item div span.num"
		housingEstatedata.Look_30 = getdata(doc, day30numstr)
	}

	return &housingEstatedata
}
