package main

import (
	"errors"
	"fmt"
	"protorpc-service/pb"
)

// 算术运算结构体
type Arith struct {
}

// 乘法运算方法
func (this *Arith) Multiply(req *pb.ArithRequest, res *pb.ArithResponse) error {
	fmt.Println("Arith) Multiply:")
	res.Pro = req.GetA() * req.GetB()
	return nil
}

// 除法运算方法
func (this *Arith) Divide(req *pb.ArithRequest, res *pb.ArithResponse) error {
	fmt.Println("Arith) Divide:")
	if req.GetB() == 0 {
		return errors.New("divide by zero")
	}
	res.Quo = req.GetA() / req.GetB()
	res.Rem = req.GetA() % req.GetB()
	return nil
}

// 加法方法
func (this *Arith) Add(req *pb.ArithRequest, res *pb.ArithResponse) error {
	fmt.Println("Arith) Add:")
	res.Pro = req.GetA() + req.GetB()
	return nil
}

// 加法方法
func (this *Arith) Error(req *pb.ArithRequest, res *pb.ArithResponse) error {
	fmt.Println("Arith error....")
	return nil
}

func main() {
	pb.ListenAndServeArithService("tcp", "127.0.0.1:8097", new(Arith))
	fmt.Println("111111")
}
