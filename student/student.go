package student

import "fmt"

type Student interface {
	AddClass() error
	AttendClass() error
}

type MiddleStudent struct {
	op *Options
}

func (s *MiddleStudent) AddClass() error {
	fmt.Println("AddClass..., name:" + s.op.Name)
	fmt.Println("AddClass..., email:" + s.op.Email)
	fmt.Println("AddClass..., Age:" + fmt.Sprintf("%d", s.op.Age))
	// fmt.Println("AddClass..., addrs:")
	return nil
}
func (s *MiddleStudent) AttendClass() error {
	fmt.Println("AttendClass..., name:" + s.op.Name)
	fmt.Println("AddClass..., email:" + s.op.Email)
	fmt.Println("AddClass..., Age:" + fmt.Sprintf("%d", s.op.Age))
	return nil
}

func CreateMiddleStudent(ops ...Option) *MiddleStudent {
	res := MiddleStudent{
		op: &Options{},
	}
	for _, v := range ops {
		v(res.op)
	}

	return &res
}

type Options struct {
	Name  string
	Age   uint8
	Addrs []string
	Email string
}

type Option func(*Options)

func Addrs(addrs ...string) Option {
	return func(o *Options) {
		o.Addrs = addrs
	}
}

func Name(name string) Option {
	return func(o *Options) {
		o.Name = name
	}
}

func Email(email string) Option {
	return func(o *Options) {
		o.Email = email
	}
}

func Age(age uint8) Option {
	return func(o *Options) {
		o.Age = age
	}
}
