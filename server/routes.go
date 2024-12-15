package server

import (
	healthRouter "cryptofolio/modules/health/infrastructure"

	"github.com/gin-gonic/gin"
)

func SetupRouter(r *gin.Engine) *gin.Engine {
	healthRouter.SetupRouter(r)

	return r
}
