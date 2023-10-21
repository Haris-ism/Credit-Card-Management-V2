package usecase

import (
	cModels "cc-callback/controllers/models"
	host "cc-callback/hosts"
	hm "cc-callback/hosts/merchant/models"
	mModels "cc-callback/hosts/merchant/models"

	"cc-callback/models"

	postgre "cc-callback/databases/postgresql"
	redis_db "cc-callback/databases/redis"
)

type (
	usecase struct {
		postgre postgre.PostgreInterface
		redis   redis_db.RedisInterface
		host	host.HostInterface
	}
	UsecaseInterface interface {
		WriteRedis(models.RedisReq) error
		ReadRedis(req models.RedisReq) (string, error)
		InsertDB(req models.ItemList) error
		InquiryItems()([]hm.InquiryItems,error)
		InquiryDiscounts()([]hm.InquiryDiscounts,error)
		TransItem(req hm.TransactionItems, headers cModels.ReqHeader)(mModels.ResponseItems,error)
	}
)

func InitUsecase(postgre postgre.PostgreInterface, redis redis_db.RedisInterface, host host.HostInterface) UsecaseInterface {
	return &usecase{
		postgre: postgre,
		redis:   redis,
		host: host,
	}
}
