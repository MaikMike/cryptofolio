package server

import (
	"cryptofolio/shared/logger"

	"github.com/gin-gonic/gin"
)

func SetupMiddlewares(r *gin.Engine) {

	log := logger.NewZerologLogger()
	r.Use(logger.LoggingMiddleware(log))
}
