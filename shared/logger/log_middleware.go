package logger

import (
	"bytes"
	"io"

	"cryptofolio/shared/utils"

	"github.com/gin-gonic/gin"
)

func LoggingMiddleware(log Logger) gin.HandlerFunc {
	return func(c *gin.Context) {
		requestID := utils.UniqueId(8)
		bodyBytes, _ := io.ReadAll(c.Request.Body)
		c.Request.Body = io.NopCloser(bytes.NewReader(bodyBytes))

		fields := map[string]interface{}{
			"method":     c.Request.Method,
			"path":       c.Request.URL.Path,
			"request-id": requestID,
			"remote-ip":  c.ClientIP(),
			"body":       string(bodyBytes),
		}

		Info(log, "Request received", fields)

		c.Next()

		fields["status"] = c.Writer.Status()
		Info(log, "Request completed", fields)
	}
}
