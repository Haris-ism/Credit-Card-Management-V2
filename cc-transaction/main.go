package main

import (
	controller "cc-transaction/controllers"
	postgre "cc-transaction/databases/postgresql"
	redis_db "cc-transaction/databases/redis"
	router "cc-transaction/routers"
	usecase "cc-transaction/usecases"
)

func main() {
	postgre := postgre.InitPostgre()
	redis := redis_db.InitRedis()
	uc := usecase.InitUsecase(postgre, redis)
	con := controller.InitController(uc)

	router.MainRouter(con)

}
