package server

import (
	healthRouter "cryptofolio/modules/health/infrastructure"

	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()

	healthRouter.SetupRouter(r)

	return r
}
