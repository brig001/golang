package main

import (
	"fmt"
	"time"
)

// func (client *Client) TagResourcesWithChan(request *TagResourcesRequest) (<-chan *TagResourcesResponse, <-chan error) {
// 	responseChan := make(chan *TagResourcesResponse, 1)
// 	errChan := make(chan error, 1)
// 	err := client.AddAsyncTask(func() {
// 		defer close(responseChan)
// 		defer close(errChan)
// 		response, err := client.TagResources(request)
// 		if err != nil {
// 			errChan <- err
// 		} else {
// 			responseChan <- response
// 		}
// 	})
// 	if err != nil {
// 		errChan <- err
// 		close(responseChan)
// 		close(errChan)
// 	}
// 	return responseChan, errChan
// }

type Response struct {
	code    int
	message string
}

func DoWork(name string) (<-chan *Response, <-chan error) {
	responseChan := make(chan *Response, 1)
	errChan := make(chan error, 1)

	go func() {
		time.Sleep(time.Second * 2)
		res := Response{
			code:    0,
			message: name + " is success",
		}
		time.Sleep(time.Second * 1)
		responseChan <- &res
		// err := errors.New("error is not null")
		var err error
		if err != nil {
			errChan <- err
		}
	}()

	return responseChan, errChan
}

func main() {
	fmt.Println("00000")

	resChan, errChan := DoWork("liming")
	if resChan == nil {
		fmt.Println("resChan is nil")
	}
	
	select {
	case <-time.After(time.Minute * 10):
	case res := <-resChan:
		if res == nil {
			fmt.Println(res == nil)
			break
		}
		fmt.Println(" get res:%v", res)
	case err := <-errChan:
		if err == nil {
			fmt.Println("err is nil")
		}
		if err != nil {
			fmt.Println(err.Error())
		}
	}
	fmt.Println("11111")
}
