package merchant

import (
	"cc-callback/constants"
	"cc-callback/utils"
	"net/http"

	"github.com/parnurzeal/gorequest"
)

type(
	merchant struct{
		merchantHost		string
		inquiryItems		string
		inquiryDiscounts	string
		transactionItems	string
	}
	MerchantInterface interface{
		Send(types string, body interface{},header http.Header)(gorequest.Response,[]byte,error)
	}
)

func (m *merchant)Send(types string, body interface{},header http.Header)(gorequest.Response,[]byte,error){
	var url string
	var method string
	switch types{
		case constants.INQUIRY_ITEMS:
			url=m.merchantHost+m.inquiryItems
			method=constants.HTTP_GET
		case constants.INQUIRY_DISCOUNTS:
			url=m.merchantHost+m.inquiryDiscounts
			method=constants.HTTP_GET
		case constants.TRANSACTION_ITEMS:
			url=m.merchantHost+m.transactionItems
			method=constants.HTTP_POST
	}
	res,data,err:=utils.HTTPRequest(url,method,body,header)
	
	if err!=nil{
		return res,data,err
	}
	return res,data,nil
}

func InitMerchant()MerchantInterface{
	return &merchant{
		merchantHost:utils.GetEnv("MERCHANT_HOST"),
		inquiryItems: utils.GetEnv("MERCHANT_INQUIRY_ITEMS"),
		inquiryDiscounts: utils.GetEnv("MERCHANT_INQUIRY_DISCOUNTS"),
		transactionItems:utils.GetEnv("MERCHANT_TRANSACTION_ITEMS"),
	}
}