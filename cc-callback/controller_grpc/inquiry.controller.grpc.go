package controller_grpc

import (
	"cc-callback/constants"
	"cc-callback/protogen/merchant"
	"context"
	"net/http"

	"google.golang.org/protobuf/types/known/emptypb"
)

func (g *ControllerGrpc) InquiryItems(ctx context.Context, empt *emptypb.Empty) (*merchant.InquiryMerchantItemsModel, error){
	res:=merchant.InquiryMerchantItemsModel{
		Message:constants.SUCCESS,
		Code:http.StatusOK,
	}
	result,err:=g.uc.InquiryItems()
	
	if err!=nil{
		res.Message=err.Error()
		res.Code=http.StatusInternalServerError
	}
	res.Data=result
	return &res,nil
}

func (g *ControllerGrpc) InquiryDiscounts(context.Context, *emptypb.Empty) (*merchant.InquiryMerchantDiscountsModel, error){
	res:=merchant.InquiryMerchantDiscountsModel{
		Message:constants.SUCCESS,
		Code:http.StatusOK,
	}
	result,err:=g.uc.InquiryDiscounts()
	
	if err!=nil{
		res.Message=err.Error()
		res.Code=http.StatusInternalServerError
	}
	res.Data=result
	return &res,nil
}