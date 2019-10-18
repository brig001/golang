package module

import (
	"realty/crawldata"
	// "database/sql/driver"

	"log"

	_ "github.com/go-sql-driver/mysql"
)

func inserthousingestate(data *crawldata.LianjiaHousingEstate) error {
	//插入数据
	stmt, err := DB_Public.Prepare(`insert into t_lianjia_housingestate (name, price, solding,buy_90, look_30, day) values  (?,?,?,?,?, NOW())`)
	if err == nil {
		res, err := stmt.Exec(data.Name, data.Price, data.Solding, data.Buy_90, data.Look_30)
		if err == nil {
			log.Println(res)
			return nil
		}
	}

	return err
}

func CollectHousingeState(datalist []*crawldata.LianjiaHousingEstate) {
	InitDB()
	defer CloseDB()
	for i := 0; i < len(datalist); i++ {
		err := inserthousingestate(datalist[i])
		if err != nil {
			log.Println("inserthousingestate, err:", err.Error())
		}
	}
}
