package main

import (
	"github.com/labstack/echo/v4"
	"github.com/norbertgruszka/dciot-device-service/handlers"
)

func main() {
	e := echo.New()
	e.GET("/", echo.NotFoundHandler)
	e.GET("/devices/health", handlers.HealthStatus)

	e.Logger.Fatal(e.Start(":8080"))
}
