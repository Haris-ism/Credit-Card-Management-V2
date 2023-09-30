package usecase

import (
	"cc-transaction/models"

	postgre "cc-transaction/databases/postgresql"
	redis_db "cc-transaction/databases/redis"
)

type (
	usecase struct {
		postgre postgre.PostgreInterface
		redis   redis_db.RedisInterface
	}
	UsecaseInterface interface {
		WriteRedis(models.RedisReq) error
		ReadRedis(req models.RedisReq) (string, error)
		InsertDB(req models.ItemList) error
		QueryDB(req []models.ItemList) error
	}
)

func InitUsecase(postgre postgre.PostgreInterface, redis redis_db.RedisInterface) UsecaseInterface {
	return &usecase{
		postgre: postgre,
		redis:   redis,
	}
}
