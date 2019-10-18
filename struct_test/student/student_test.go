package student

import (
	"fmt"
	"testing"
)

func Test_CreateMiddleStudent(t *testing.T) {
	//case 1=============================
	s := CreateMiddleStudent(func(op *Options) {
		if op != nil {
			op.Name = "liming"
		} else {
			panic("op is nil")
		}
	}, func(op *Options) {
		if op != nil {
			op.Email = "liming Email"
		} else {
			panic("op is nil")
		}
	})
	s.AddClass()
	s.AttendClass()
	//case 2=============================
	s = CreateMiddleStudent(Addrs("江西九江十里大道110号"), Name("liming002"), Email("liming619810@163.com"), Age(30))
	s.AddClass()
	s.AttendClass()

	fmt.Println(s)
}
