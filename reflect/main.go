package main

import (
	"fmt"
	"reflect"
)

type User struct {
	id   int
	Name string
	Age  int
}

func (u User) ReflectCallFunc() {
	fmt.Println("Allen.Wu ReflectCallFunc")
}

func main() {
	user := User{1, "Allen.Wu", 25}
	DoFiledAndMethod(user)
	fmt.Println(&user)
	setProperty()
	p := Person{
		name: "liming",
		age:  18,
	}

	SetProperty(p)
}

// 通过接口来获取任意参数，然后一一揭晓
func DoFiledAndMethod(input interface{}) {

	getType := reflect.TypeOf(input)
	fmt.Println("get Type is :", getType.Name())

	getValue := reflect.ValueOf(input)
	fmt.Println("get all Fields is:", getValue)

	// 获取方法字段
	// 1. 先获取interface的reflect.Type，然后通过NumField进行遍历
	// 2. 再通过reflect.Type的Field获取其Field
	// 3. 最后通过Field的Interface()得到对应的value
	for i := 0; i < getType.NumField(); i++ {
		field := getType.Field(i)
		value := getValue.Field(i).Interface()
		fmt.Printf("%s: %v = %v\n", field.Name, field.Type, value)
	}

	// 获取方法
	// 1. 先获取interface的reflect.Type，然后通过.NumMethod进行遍历
	for i := 0; i < getType.NumMethod(); i++ {
		m := getType.Method(i)
		fmt.Printf("%s: %v\n", m.Name, m.Type)
	}
}

// 定义结构体Person
type Person struct {
	name string
	age  int
}

func setProperty() {
	person := Person{
		name: "liming",
		age:  18,
	}
	fmt.Println(person)                    // 修改前 { 0}
	pp := reflect.ValueOf(&person)         // 取得struct变量的指针
	field := pp.Elem().FieldByName("name") //获取指定Field
	field.SetString("gerrylon")            // 设置值

	field = pp.Elem().FieldByName("age")
	field.SetInt(26)

	fmt.Println(person) // 修改后 {gerrylon 26}
}

func SetProperty(obj Person) {
	fmt.Println(obj)                       // 修改前 { 0}
	pp := reflect.ValueOf(&obj)            // 取得struct变量的指针
	field := pp.Elem().FieldByName("name") //获取指定Field
	field.SetString("gerrylon")            // 设置值
	field = pp.Elem().FieldByName("age")
	if !field.IsNil() {
		switch k := field.Type().Kind(); k {
		case reflect.String:
			field.SetString("")
		}

	}
	field = pp.Elem().FieldByName("Age1")
	if !field.IsNil() {
		field.SetInt(26)
	}

	fmt.Println(obj) // 修改后 {gerrylon 26}
}
