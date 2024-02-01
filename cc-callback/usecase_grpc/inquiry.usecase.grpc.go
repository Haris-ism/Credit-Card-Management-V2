package usecase_grpc

import (
	"cc-callback/constants"
	"cc-callback/protogen/merchant"
	"errors"
	"log"
)

func (uc *usecaseGrpc)InquiryItems()([]*merchant.InquiryItemsModel, error){
	log.Println("masuk uc")
	res,err:=uc.host.Merchant().InquiryItems()
	if err!=nil{
		log.Println("err:",err)
		return res.Data, errors.New(constants.ERROR_DB)
	}
	if res.Code!=200{
		log.Println("err res code:",res.Code)
		return res.Data, errors.New(constants.ERROR_INQUIRY)
	}
	log.Println("grpc res:",res)
	return res.Data,nil
}

func (uc *usecaseGrpc)InquiryDiscounts()([]*merchant.InquiryDiscountsModel, error){
	log.Println("masuk uc")
	res,err:=uc.host.Merchant().InquiryDiscounts()
	if err!=nil{
		log.Println("err:",err)
		return res.Data, errors.New(constants.ERROR_DB)
	}
	if res.Code!=200{
		log.Println("err res code:",res.Code)
		return res.Data, errors.New(constants.ERROR_INQUIRY)
	}
	log.Println("grpc res:",res)
	return res.Data,nil
}
