package main

import (
	"fmt"
	"strconv"
)

type Element interface {
	String() string
}
type List []Element

type Human struct {
	name  string
	age   int
	phone string
}

// 通过这个方法 Human 实现了 fmt.Stringer
func (h *Human) String() string {
	return "❰" + h.name + " - " + strconv.Itoa(h.age) + " years -  ✆ " + h.phone + "❱"
}

// user interface

func DoWork(element Element) {
	fmt.Println(element.String() + " is work")
}

func CheckClassType(element Element) {
	if item, ok := (element).(*Human); ok {
		fmt.Println("check type:" + item.String())
	}
}

func main() {

	Bob := Human{"Bob", 39, "000-7777-XXX"}
	fmt.Println("This Human is : ", Bob)

	var element Element
	element = &Bob

	DoWork(element)
	CheckClassType(element)
}
