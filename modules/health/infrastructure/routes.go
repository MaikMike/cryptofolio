package intrastructure

// File: routes.go
import (
	"github.com/gin-gonic/gin"
)

func SetupRouter(r *gin.Engine) {
	r.GET("/health", HealthHandler)
}
