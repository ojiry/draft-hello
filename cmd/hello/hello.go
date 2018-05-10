package main

import (
	"fmt"

	"github.com/Azure/draft/pkg/version"
)

func main() {
	v := version.New()
	fmt.Println("Draft Hello!")
	fmt.Printf("draft: %v", v.SemVer)
}
