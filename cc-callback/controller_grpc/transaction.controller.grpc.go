package controller_grpc

import (
	"cc-callback/constants"
	"cc-callback/protogen/merchant"
	"context"
	"net/http"
)

func (g *ControllerGrpc) TransItems(ctx context.Context,req *merchant.ReqTransItemsModel) (*merchant.ResMerchantTransModel, error){
	res:=&merchant.ResMerchantTransModel{
		Message:constants.SUCCESS,
		Code:http.StatusOK,
	}
	resp,err:=g.uc.TransItems(ctx,req)
	if err!=nil{
		res.Message=err.Error()
		res.Code=http.StatusInternalServerError
		return res,err
	}
	res.Data=resp
	return res,nil
}
