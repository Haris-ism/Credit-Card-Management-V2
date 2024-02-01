package usecase

import (
	cModels "cc-callback/controller/models"
	host "cc-callback/hosts"
	hm "cc-callback/hosts/merchant/models"

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
		// InquiryItemss()(*callback.InquiryMerchantItemsModel, error)
		InquiryDiscounts()([]hm.InquiryDiscounts,error)
		TransItem(req hm.DecTransactionItems, headers cModels.ReqHeader)(string,error)
	}
)

func InitUsecase(postgre postgre.PostgreInterface, redis redis_db.RedisInterface, host host.HostInterface) UsecaseInterface {
	return &usecase{
		postgre: postgre,
		redis:   redis,
		host: host,
	}
}
