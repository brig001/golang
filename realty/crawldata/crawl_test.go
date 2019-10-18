package crawldata

import "testing"
import "log"

// func Test_FetchHousingEstate(t *testing.T) {
// 	LianjiaHousingEstate := FetchHousingEstate(HousingEstateName[SHsmbjhy], HousingEstateURL[SHsmbjhy])
// 	log.Println("LianjiaHousingEstate:", LianjiaHousingEstate)
// }

func Test_Fetch(t *testing.T) {
	// Fetch() *Lianjiadata
	data := Fetch()
	log.Println("data:", data)
}

func Test_Fetch_JingDongAuction(t *testing.T) {
	Fetch_JingDongAuction()
}

func Test_FetchWAWJData(t *testing.T) {
	FetchWAWJData()
}
