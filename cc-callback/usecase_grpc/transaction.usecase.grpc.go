package usecase_grpc

import (
	"cc-callback/constants"
	"cc-callback/protogen/merchant"
	"context"
	"errors"
	"log"

	"google.golang.org/grpc/metadata"
)

func (uc *usecaseGrpc)TransItems(ctx context.Context, req *merchant.ReqTransItemsModel)(string, error){

	res:=""
	header, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return res, errors.New(constants.ERROR_HEADER)
	}
	meta:=map[string]string{
		"timestamp":header.Get("timestamp")[0],
		"signature":header.Get("signature")[0],
	}
	md := metadata.New(meta)
	ctxHost:=metadata.NewOutgoingContext(context.Background(),md)
	resHost,err:=uc.host.Merchant().TransItems(ctxHost,req)
	if err!=nil{
		log.Println("err:",err)
		return res, errors.New(constants.ERROR_DB)
	}
	if resHost.Code!=200{
		log.Println("err res code:",resHost.Code)
		return res, errors.New(constants.ERROR_INQUIRY)
	}
	log.Println("grpc res:",resHost)
	return resHost.Data,nil
}