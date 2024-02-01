package usecase

import (
	"cc-callback/constants"
	cModels "cc-callback/controller/models"
	"cc-callback/hosts/merchant/models"
	"encoding/json"
	"errors"
	"net/http"
)

func (uc *usecase)TransItem(req models.DecTransactionItems, headers cModels.ReqHeader)(string,error){
	result:=models.ResponseTransactionItems{}
	header := make(http.Header)
	header.Add("Accept", "*/*")
	header.Add("Content-Type", "application/json")
	header.Add("TimeStamp", headers.TimeStamp)
	header.Add("Signature", headers.Signature)
	_,bytes,err:=uc.host.Merchant().Send(constants.TRANSACTION_ITEMS,req,header)
	if err!=nil{
		return result.Data, errors.New(constants.ERROR_HOST)
	}
	
	err=json.Unmarshal(bytes,&result)
	if err!=nil{
		return result.Data, errors.New(constants.ERROR_HOST)
	}
	if result.Code!=200{
		return result.Data, errors.New(result.Message)
	}
	return result.Data,nil
}