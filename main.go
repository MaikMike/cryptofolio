package main

import (
	"cryptofolio/server"
	"cryptofolio/shared/schemas"
	"log"
	"os"

	"github.com/gin-gonic/gin"

	"github.com/joho/godotenv"
)

func main() {
	envs := loadEnvs()
	schemas.Validate("./shared/schemas/env-schema.json", envs)

	r := gin.Default()

	server.SetupMiddlewares(r)
	server.SetupRouter(r)
	r.Run(":" + envs["PORT"])
}

func loadEnvs() map[string]string {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	envs := map[string]string{
		"PORT": os.Getenv("PORT"),
	}

	return envs
}
