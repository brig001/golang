package main

import (
  "log"
  "os"

  "github.com/urfave/cli/v2"
)

func main() {
  app := &cli.App{
    Commands: []*cli.Command{
      {
        Name: "noop",
      },
      {
        Name:     "add",
        Category: "template",
      },
      {
        Name:     "remove",
        Category: "template",
      },
    },
  }

  err := app.Run(os.Args)
  if err != nil {
    log.Fatal(err)
  }
}