package main

import (
	"fmt"
	"time"

	"github.com/dgrijalva/jwt-go"
)

const RSA_PublicKey = `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCTgQLEfXd9afSB15pVC/yepGK3
OAYe4g4B0NTBdJOBd+jkkfD5cmRcFqSwUtdhPUmKtGst4xcL+MGbG2VnvFoFGdQN
T2XsUSwunQXyNeyCwr5RluAeoHvWvqI2KBTjM5A5uxgAdsbx4yfta88JQUxUc2GO
fdgAf4/yQ1omETO7FQIDAQAB
-----END PUBLIC KEY-----`

const RSA_PrivateKey = `-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,8D0335C44F01673A

3yMaUPeJycxBpRfT+xjeME9mMP5TcGKVU/3jdb/tAorhuEOJrA8LseVprPwD2Gf/
f7H0UUkV1SELwebhTgMBGkcT6Ac2ikKCFdd1rMDoDl8xM29wH3aw5rcsm7uMKtdN
SvdxwWJrkkXVruxVXxhRw1s78j8eY9rLwmwc/OJ9fb+HWVxqDfLe4pEDNW7fCGi9
9fMkDJoJ02JeSW1lObDJEWpCEyoKEEckRacc6IGemHSO4QCZt2O2Bs9ywPBNdfKq
kO2YHfmk1wnbS9Al2YW+CY0fuIelJbn4I1PSsyh8p3edxt7T0OC60iNf+IN61k8i
+OGBxwVdVNIgs78AIsLTQE+5wXir1r4IW+jCMP2rMHI8/1QqYRvVqmlTe2PAjoE+
XpFqdXegXGegwxclMWXE2jfmkO6KGXf8Prt4xvhfJL6vQVBBZ+U6e/g1seL9UW4l
6NxxcLpAL5YNLqACgSKHH6KE3aqBCsBcd1vZ+GWIbPg2TcgQUeHs3HnTtxwZmLRl
nCafNeuAVdQv+plzCwwjWlePlSItvjIhtPfkUjfIPrwXyYkTxKE2emD4kmGfJqwf
/F/CZ1DC8A4mJjDfjMK6uUp6rx+QUAuaeQQm8DAJu+E/QWK8sXOsf0nGcCuwuZwb
5R1NKtMBewlOGjJZhdekvgdJOOEmtym/K/f9BPlFt5Hy2FMjCobhI3B92rjuxxtS
Cvc9vIWzA7MQKMrPhdcpOyJqPgDq9Hk4MgqGBv4eRs0rrm0rrGQaVXTMWSXB8YrJ
+eqPaUp3mO0wouzpzpW7Ndc4ABlt1flALoj4Yg7B3wc=
-----END RSA PRIVATE KEY-----`

const RSA_Password = "htc-oauth-service"

//签名, 生成token
func Signed() (string, error) {
	mySigningPrivateKey := []byte(RSA_PrivateKey)

	// Create the Claims
	claims := &jwt.StandardClaims{
		Id:        "userid 0001",
		ExpiresAt: time.Now().Add(time.Second * 30).Unix(),
		Issuer:    "username liming",
	}

	token := jwt.NewWithClaims(jwt.SigningMethodRS512, claims)
	privateKey, err := jwt.ParseRSAPrivateKeyFromPEMWithPassword(mySigningPrivateKey, RSA_Password)
	if err != nil {
		panic(err.Error())
	}
	ss, err := token.SignedString(privateKey)
	fmt.Printf("%v %v", ss, err)
	return ss, err
}

//验证并解析token
func VerifyToken(token string) (*jwt.Token, error) {
	PubKeyValue := []byte(RSA_PublicKey)

	// fmt.Println(PubKey)
	ss, err := jwt.ParseWithClaims(token, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		// if !token.Valid {
		// 	return nil, errors.New("token is invalid...")
		// }
		PubKey, err := jwt.ParseRSAPublicKeyFromPEM(PubKeyValue)
		if err != nil {
			panic(err.Error())
		}
		return PubKey, token.Claims.Valid()
	})
	fmt.Printf("%v %v", ss, err)
	return ss, err
}

func main() {
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
