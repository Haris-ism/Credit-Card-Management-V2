package main

import (
	"cc-callback/controller"
	"cc-callback/controller_grpc"
	postgre "cc-callback/databases/postgresql"
	redis_db "cc-callback/databases/redis"
	grpc_client "cc-callback/grpc/client"
	grpc_merchant "cc-callback/grpc/client/merchant"

	grpc_server "cc-callback/grpc/server"
	host "cc-callback/hosts"
	merchantHost "cc-callback/hosts/merchant"
	router "cc-callback/routers"
	"cc-callback/usecase"
	"cc-callback/usecase_grpc"
)

func main() {
	
	postgre := postgre.InitPostgre()
	redis := redis_db.InitRedis()
	
	merchants:=merchantHost.InitMerchant()
	host:=host.InitHost(merchants)
	uc := usecase.InitUsecase(postgre, redis, host)
	con := controller.InitController(uc)
	
	merchantGrpc:=grpc_merchant.InitGrpcMerchant()
	hostGrpc:=grpc_client.InitGrpcClient(merchantGrpc)
	ucGrpc:=usecase_grpc.InitUsecaseGrpc(postgre,redis,hostGrpc)
	conGrpc:=controller_grpc.InitControllerGrpc(ucGrpc)
	go func(){
		// res:=hostGrpc.Merchant().InquiryItems()
		// fmt.Println("res grpc merchant:",res)
		grpc_server.InitGrpcServer(conGrpc)
	}()
	router.MainRouter(con)

}

