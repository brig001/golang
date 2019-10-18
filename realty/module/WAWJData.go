package module

import (
	"database/sql"
	"realty/crawldata"
	"time"
	// "database/sql/driver"
	"errors"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

//FetchWAWJData()

func insertWAWJData(data *crawldata.WoAiWoJiaMarketData) error {
	DB, err := sql.Open(DBtype, SqlConStr)
	if DB == nil {
		return err
	}
	defer DB.Close()

	stmt, err := DB.Prepare("Insert t_woaiwojia_mouth_market_data Set price_deal=?, price_sale =?,house_deal = ?, house_sale = ?,new_customer = ?, look_num = ?,near_7_day_look_num = ? ,date=now()")
	if err == nil {
		res, err := stmt.Exec(data.PriceDeal, data.PriceSale, data.HouseDeal, data.HouseSale, data.NewCustomer, data.LookNum, data.Near7DayLookNum)
		if err == nil {
			log.Println(res)
			return nil
		}
	}
	return err
}

func DelWAWJData(data *crawldata.WoAiWoJiaMarketData) (bool, error) {
	DB, err := sql.Open(DBtype, SqlConStr)
	if DB == nil {
		return false, err
	}
	defer DB.Close()

	today := time.Now().Format("2006-01-02")
	stmt, err := DB_Public.Prepare("delete from t_woaiwojia_mouth_market_data where date=?")
	if err == nil {
		res, err := stmt.Exec(today)
		if err == nil {
			log.Println(res)
			return true, nil
		}
	}
	return false, nil
}

func CollectWAWJdata(data *crawldata.WoAiWoJiaMarketData) {
	if data == nil {
		err := errors.New("data  = nil")
		panic(err)
	}
	InitDB()
	defer CloseDB()

	//删除数据
	log.Println("待删除数据...")
	del_success, err := DelWAWJData(data)
	if del_success {
		log.Println("删除数据 success")
	} else {
		log.Println("删除数据 fail，", err)
	}

	err = insertWAWJData(data)
	if err != nil {
		log.Println("数据写入失败..")
		panic(err)
	}

}
