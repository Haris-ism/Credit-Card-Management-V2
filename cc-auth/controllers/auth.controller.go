package controller

import (
	auth "cc-auth/controllers/models"
	"cc-auth/models"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func (c *controller) Register(ctx *gin.Context) {
	res := models.GeneralResponse{
		Message: "Success",
		Code:    200,
	}
	req := auth.Credentials{}

	if err := ctx.BindJSON(&req); err != nil {
		res.Message = "Invalid Input"
		res.Code = 400
		ctx.JSON(http.StatusOK, res)
		return
	}

	fmt.Println(req)

	ctx.JSON(http.StatusOK, res)
}
