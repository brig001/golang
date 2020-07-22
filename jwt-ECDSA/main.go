package main

import (
	"fmt"
	"time"

	"github.com/dgrijalva/jwt-go"
)

const ECDSA_PrivateKey=`-----BEGIN PRIVATE KEY-----
MIHcAgEBBEIBNW1hQdKaIAMQeOYB29WInQK9YikkRn6psH+x5O5n/IZJ1UG6hxOi
A+a2UnYyC3Mm8hFHPkLIT3UCMs2xKWjZIL+gBwYFK4EEACOhgYkDgYYABABd34j9
YkiXXQiEFtAX+5+BcyLXF7cEEHNEWpchNfa4aWq1aJtFq4RdT/Cci6OkWC3zVcl1
lsRxSizOo/dlt4jyzgCOqu2a0CXRxywxIzVgMaAy3myt+zXfl1wapsJTH8br+mtx
X7iRw5mGfxfhlZ6yoQ6xhzaETWa3JOEi2c7lvq8yTg==
-----END PRIVATE KEY-----`

const ECDSA_PublicKey = `-----BEGIN PUBLIC KEY-----
MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQAXd+I/WJIl10IhBbQF/ufgXMi1xe3
BBBzRFqXITX2uGlqtWibRauEXU/wnIujpFgt81XJdZbEcUoszqP3ZbeI8s4Ajqrt
mtAl0ccsMSM1YDGgMt5srfs135dcGqbCUx/G6/prcV+4kcOZhn8X4ZWesqEOsYc2
hE1mtyThItnO5b6vMk4=
-----END PUBLIC KEY-----`



//签名, 生成token
func Signed()(string, error){
	mySigningPrivateKey := []byte(ECDSA_PrivateKey)

	// Create the Claims
	claims := &jwt.StandardClaims{
		Id: "userid 0001",
		ExpiresAt:  time.Now().Add(time.Second * 10).Unix(),
		Issuer:    "username liming",
	}
    
	token := jwt.NewWithClaims(jwt.SigningMethodES512, claims)
	 privateKey ,err := jwt.ParseECPrivateKeyFromPEM(mySigningPrivateKey)
	 if err != nil {
		 panic(err.Error())
	 }
	ss, err := token.SignedString(privateKey)
	fmt.Printf("%v %v", ss, err)
	return ss, err
}

//验证并解析token
func VerifyToken(token string)(*jwt.Token, error){
	PubKeyValue := []byte(ECDSA_PublicKey)
	PubKey ,err := jwt.ParseECPublicKeyFromPEM(PubKeyValue)
	if err != nil {
	  panic(err.Error())
	}
	ss, err := jwt.ParseWithClaims(token,&jwt.StandardClaims{},func(token *jwt.Token) (interface{}, error) {
		return PubKey, nil
	})
	fmt.Printf("%v %v", ss, err)
	return ss, err
}

func main(){
	token, err := Signed()
	if err != nil {
		panic(err.Error())
	}
	fmt.Println(token)

  tokenItem, err := VerifyToken(token)
  if err != nil {
	  panic(err.Error())
  }
  fmt.Println(tokenItem)
}