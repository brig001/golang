package module

import (
	"database/sql"
	"realty/crawldata"
	"time"

	// "database/sql/driver"
	"errors"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

//区域字符串
var areaId [crawldata.Changsha]int = [crawldata.Changsha]int{
	310000, //上海
	110000, //北京
	440100, //广州
	440300, //深圳
	320500, //苏州
	330100, //杭州
	320100, //南京
	420100, //武汉
	500000, // 重庆
	510100, //成都
	340100, //合肥
	370100, //济南
	610100, //西安
	430100} //长沙

var (
	DB_Public *sql.DB
	DBtype    = "mysql"
	SqlConStr string
)

//Database 数据库配置
type Database struct {
	IP          string `json:"ip"`
	Port        int    `json:"port"`
	User        string `json:"user"`
	Password    string `json:"pass"`
	Name        string `json:"name"`
	MaxIdleTime int    `json:"max_idle_time"` //ms
	MaxIdle     int    `json:"max_idle"`
	Pool        int    `json:"pool"`
	MaxOverflow int    `json:"max_overflow"`
}

func InitDB() error {
	var database *Database
	database = new(Database)
	database.IP = "localhost"
	// database.IP = "10.128.0.192"
	database.Port = 3306
	database.User = "root"
	// database.Password = "Connextpaas@0101"
	// database.User = "connextpaas"
	database.Password = "Connext@0101"
	database.Name = "internet_data"

	DBtype = "mysql"
	SqlConStr = fmt.Sprintf(
		"%s:%s@tcp(%s:%d)/%s?parseTime=true&charset=utf8",
		database.User,
		database.Password,
		database.IP,
		database.Port,
		database.Name,
	)
	var err error
	DB_Public = new(sql.DB)
	DB_Public, err = sql.Open(DBtype, SqlConStr)
	if err != nil {
		panic(err)
	}
	return err
}

func CloseDB() {
	DB_Public.Close()
}

func Insert(data *crawldata.Lianjiadata) error {
	var cityid int
	cityid = areaId[data.City]
	// log.Println("insert(data.:", data,
	// 	"data.City:", data.City,
	// 	"Agent_nums:", data.Agent_nums,
	// 	"Houses:", data.Houses,
	// 	"Yesterday_look:", data.Yesterday_look,
	// 	"HouseForRent:", data.HouseForRent,
	// 	"Buy_90:", data.Buy_90)

	//插入数据
	stmt, err := DB_Public.Prepare("insert into t_lianjia_data (cantonid,solding,90days_sold,yesterday_look,renting,agent,properties_sale, date) values (?,?,?,?,?,?,?,Now())")
	if err == nil {
		// log.Println(cityid, data.Houses, data.Buy_90, data.Yesterday_look, data.HouseForRent, data.Agent_nums)
		// _, err := stmt.Exec(cityid, data.Houses, data.Buy_90, data.Yesterday_look, data.HouseForRent, data.Agent_nums, )
		_, err := stmt.Exec(cityid, data.Houses, 0, 0, data.HouseForRent, data.Agent_nums, data.PropertiesSale)
		if err == nil {
			return nil
		}
	}
	// log.Println("Insert err:", err)
	return err
}

func IsExistData(data *crawldata.Lianjiadata) (bool, error) {
	var cityid int
	cityid = areaId[data.City]
	today := time.Now().Format("2006-01-02")
	rows, err := DB_Public.Query("select t.id from t_lianjia_data t where t.cantonid=? and t.date=?", cityid, today)
	defer rows.Close()
	log.Println(rows)
	if err == nil {
		var data_cout int
		data_cout = 0
		for rows.Next() {
			log.Println("data_cout++")
			data_cout++
		}
		if data_cout > 0 {
			return true, nil
		} else {
			return false, nil
		}
	} else {
		log.Println(" err != nil, log:  ")
		log.Println(err)
		return false, err
	}
}

func DelData(data *crawldata.Lianjiadata) (bool, error) {
	var cityid int
	cityid = areaId[data.City]
	today := time.Now().Format("2006-01-02")
	//插入数据
	stmt, err := DB_Public.Prepare("delete from t_lianjia_data where cantonid=? and date=?")
	if err == nil {
		res, err := stmt.Exec(cityid, today)
		if err == nil {
			log.Println(res)
			return true, nil
		}
	}
	return false, nil
}

func Collectdata(data *crawldata.Lianjiadata) {
	if data == nil {
		err := errors.New("data  = nil")
		panic(err)
	}
	InitDB()
	defer CloseDB()
	isInDB, err := IsExistData(data)
	if err == nil {
		if isInDB {
			//删除数据
			log.Println("待删除数据...")
			del_success, err := DelData(data)
			if del_success {
				log.Println("删除数据 success")
			} else {
				log.Println("删除数据 fail，", err)
			}
		}
		err := Insert(data)
		if err != nil {
			log.Println("数据写入失败..")
			panic(err)
		}

	}
}
