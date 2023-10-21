package main

import (
	controller "cc-callback/controllers"
	postgre "cc-callback/databases/postgresql"
	redis_db "cc-callback/databases/redis"
	host "cc-callback/hosts"
	merchantHost "cc-callback/hosts/merchant"
	router "cc-callback/routers"
	usecase "cc-callback/usecases"
)

func main() {

	merchants:=merchantHost.InitMerchant()
	host:=host.InitHost(merchants)
	postgre := postgre.InitPostgre()
	redis := redis_db.InitRedis()
	uc := usecase.InitUsecase(postgre, redis, host)
	con := controller.InitController(uc)

	router.MainRouter(con)

}

