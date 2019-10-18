package module

import (
	"database/sql"
	"realty/crawldata"
	// "database/sql/driver"
	"errors"
	"log"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

func insertTaobaoAuction(data *crawldata.TaobaoAuction, jingdongData *crawldata.JingDongAuction) error {
	DB, err := sql.Open(DBtype, SqlConStr)
	if DB == nil {
		return err
	}
	defer DB.Close()

	var cityid int
	cityid = areaId[data.City]
	// today := time.Now().Format("2006-01-02")
	//插入数据
	stmt, err := DB.Prepare("Insert t_taobao_auction Set cantonid=?,num=?,jingdong_num =?,date=now()")
	if err == nil {
		res, err := stmt.Exec(cityid, data.Num, jingdongData.Num)
		if err == nil {
			log.Println(res)
			return nil
		}
	}
	return err
}

func isExistTaobaoAuctionData(data *crawldata.TaobaoAuction) (bool, error) {
	DB, err := sql.Open(DBtype, SqlConStr)
	if DB == nil {
		return false, err
	}
	defer DB.Close()

	var cityid int
	cityid = areaId[data.City]
	today := time.Now().Format("2006-01-02")
	log.Println("cityid: ", cityid)
	log.Println("today: ", today)

	rows, err := DB.Query("select t.id from t_taobao_auction t where  t.cantonid=? and t.date=?", cityid, today)
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

func DelTaobaoAuctionData(data *crawldata.TaobaoAuction) (bool, error) {
	DB, err := sql.Open(DBtype, SqlConStr)
	if DB == nil {
		return false, err
	}
	defer DB.Close()

	var cityid int
	cityid = areaId[data.City]
	today := time.Now().Format("2006-01-02")
	//删除数据
	// log.Println("deldata 001")
	stmt, err := DB_Public.Prepare("delete from t_taobao_auction where cantonid=? and date=?")
	// log.Println("deldata 002")
	if err == nil {
		res, err := stmt.Exec(cityid, today)
		if err == nil {
			log.Println(res)
			return true, nil
		}
	}
	return false, nil
}

func CollectTaobaoAuctiondata(data *crawldata.TaobaoAuction, jingdongData *crawldata.JingDongAuction) {
	if data == nil {
		err := errors.New("data  = nil")
		panic(err)
	}
	InitDB()
	defer CloseDB()
	isInDB, err := isExistTaobaoAuctionData(data)
	if err == nil {
		if isInDB {
			//删除数据
			log.Println("待删除数据...")
			del_success, err := DelTaobaoAuctionData(data)
			if del_success {
				log.Println("删除数据 success")
			} else {
				log.Println("删除数据 fail，", err)
			}
		}

		err := insertTaobaoAuction(data, jingdongData)
		if err != nil {
			log.Println("数据写入失败..")
			panic(err)
		}
	}
}
