package main

import (
    "github.com/labstack/echo/v4"
	"webapp/pkg/config"
    "github.com/labstack/echo/v4/middleware"
)

func main() {
	port := config.GetEnv("PORT", "3000")

    e := echo.New()
    e.Static("/", "public")
    
    e.GET("/", func(c echo.Context) error {
        return c.File("public/views/webapp.html")
    })
    e.Use(middleware.LoggerWithConfig(middleware.LoggerConfig{}))
    e.Start(":" + port)
}
