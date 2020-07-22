package main

import (
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/rand"
	"crypto/x509"
	"encoding/pem"
	"fmt"
	"log"
)

func create256() {
	// 生成公钥和私钥
	privateKey, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
	if err != nil {
		log.Fatalln(err)
	}
	// 公钥是存在在私钥中的，从私钥中读取公钥
	publicKey := &privateKey.PublicKey
	message := []byte("hello,dsa签名")

	// 进入签名操作
	r, s, _ := ecdsa.Sign(rand.Reader, privateKey, message)
	// 进入验证
	flag := ecdsa.Verify(publicKey, message, r, s)
	if flag {
		fmt.Println("数据未被修改")
	} else {
		fmt.Println("数据被修改")
	}
	flag = ecdsa.Verify(publicKey, []byte("hello"), r, s)
	if flag {
		fmt.Println("数据未被修改")
	} else {
		fmt.Println("数据被修改")
	}
}

func createP521() {
	const mykey = "123456789"
	dataint, err := rand.Reader.Read([]byte(mykey))
	if err != nil {
		panic(err.Error())
	}
	fmt.Println(dataint)

	// 生成公钥和私钥
	privateKey, err := ecdsa.GenerateKey(elliptic.P521(), rand.Reader)
	if err != nil {
		log.Fatalln(err)
	}
	privateKeyPem, err := encodePrivateKey(privateKey)
	fmt.Println("privateKeyPem:", privateKeyPem)

	// 公钥是存在在私钥中的，从私钥中读取公钥
	publicKey := &privateKey.PublicKey

	publicKeyPem, err := encodePublicKey(publicKey)
	fmt.Println("publicKeyPem:", publicKeyPem)

	message := []byte("hello,dsa签名")

	// 进入签名操作
	r, s, _ := ecdsa.Sign(rand.Reader, privateKey, message)

	// 进入验证
	flag := ecdsa.Verify(publicKey, message, r, s)
	if flag {
		fmt.Println("数据未被修改")
	} else {
		fmt.Println("数据被修改")
	}

	// flag = ecdsa.Verify(publicKey, []byte("hello"), r, s)
	// if flag {
	// 	fmt.Println("数据未被修改")
	// } else {
	// 	fmt.Println("数据被修改")
	// }
}

func main() {
	// create256()
	createP521()
}

func encodePrivateKey(privateKey *ecdsa.PrivateKey) (string, error) {
	x509Encoded, err := x509.MarshalECPrivateKey(privateKey)
	if err != nil {
		return "", err
	}
	pemEncoded := pem.EncodeToMemory(&pem.Block{Type: "PRIVATE KEY", Bytes: x509Encoded})

	return string(pemEncoded), nil

}

func encodePublicKey(publicKey *ecdsa.PublicKey) (string, error) {
	x509EncodedPub, err := x509.MarshalPKIXPublicKey(publicKey)
	if err != nil {
		return "", err
	}
	pemEncodedPub := pem.EncodeToMemory(&pem.Block{Type: "PUBLIC KEY", Bytes: x509EncodedPub})

	return string(pemEncodedPub), nil
}

func decodePrivateKey(pemEncoded string) (*ecdsa.PrivateKey, error) {
	block, _ := pem.Decode([]byte(pemEncoded))
	x509Encoded := block.Bytes
	privateKey, err := x509.ParseECPrivateKey(x509Encoded)
	if err != nil {
		return nil, err
	}

	return privateKey, nil
}

func decodePubKey(pemEncoded string) (*ecdsa.PublicKey, error) {
	blockPub, _ := pem.Decode([]byte(pemEncoded))
	x509EncodedPub := blockPub.Bytes
	genericPublicKey, err := x509.ParsePKIXPublicKey(x509EncodedPub)
	if err != nil {
		return nil, err
	}
	publicKey := genericPublicKey.(*ecdsa.PublicKey)

	return publicKey, nil
}
