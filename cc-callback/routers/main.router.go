package router

import (
	"cc-callback/controller"
	"cc-callback/middleware"
	"cc-callback/utils"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

func MainRouter(con controller.ControllerInterface) {
	r := gin.Default()
	r.Use(middleware.Cors)
	v1 := r.Group("v1")
	{
		v1.GET("/ping", con.Ping)
		v1.POST("/writeredis", con.WriteRedis)
		v1.POST("/readredis", con.ReadRedis)
		v1.POST("/postgre/insert", con.InsertPostgre)
	}
	v2:= r.Group("v2")
	{
		inquiry:=v2.Group("/inquiry")
		{
			inquiry.GET("/items",con.InquiryItems)
			inquiry.GET("/discounts",con.InquiryDiscounts)
		}
		transaction:=v2.Group("/transaction")
		{
			transaction.POST("/items",con.TransItem)
		}
	}

	logrus.Info("starts")
	r.Run(utils.GetEnv("PORT")) // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
