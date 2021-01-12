package util

import (
	"math/rand"
	"strconv"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().UnixNano())
}

//RandomInt generates arandom number between min and max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

//RandomString generates a string of n characters
func RandomString(n int) string {
	var sb strings.Builder
	length := len(alphabet)
	for i := 0; i < n; i++ {
		sb.WriteByte(alphabet[rand.Intn(length)])
	}
	return sb.String()
}

//RandomCustomerRef returns a random customer ref
func RandomCustomerRef() string {
	return RandomString(3) + strconv.FormatInt(RandomInt(100000, 1000000000), 10)
}

//RandomCustomerName returns a random customer ref
func RandomCustomerName() string {
	return RandomString(15)
}

//RandomCustomerMail returns a random customer ref
func RandomCustomerMail() string {
	return RandomString(15)
}

//RandomCustomerAddress returns a random customer ref
func RandomCustomerAddress() string {
	return RandomString(15)
}
