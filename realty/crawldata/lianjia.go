package crawldata

type Citys uint8

const (
	Shanghai  Citys = 1 + iota //上海
	Beijing                    //北京
	Guangzhou                  //广州
	Shenzhen                   //深圳
	Suzhou                     // 苏州
	Hangzhou                   //杭州
	Nanjing                    //南京
	Wuhan                      //武汉
	Chongqing                  //重庆
	Chengdu                    // 成都
	Hefei                      //合肥
	Jinan                      //济南
	Xian                       //西安
	Changsha                   //长沙
)

//链家数据
type Lianjiadata struct {
	City           Citys
	Houses         string //今日挂牌房源总数
	Yesterday_look string //昨日代看
	Buy_90         string //近90天成交
	HouseForRent   string //今日租房数量
	Agent_nums     string // 今日当前城市链家经纪人数量
	PropertiesSale string // 今日当前城市链家楼盘数量
}

