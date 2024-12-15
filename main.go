package main

import (
	"cryptofolio/server"
)

func main() {
	r := server.SetupRouter()

	r.Run(":8080")
}
