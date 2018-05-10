package main

import (
	"fmt"

	draftVersion "github.com/Azure/draft/pkg/version"
	helmVersion "k8s.io/helm/pkg/version"
)

func main() {
	v := draftVersion.New()
	fmt.Println("Draft Hello!")
	fmt.Printf("draft: %v\n", v.SemVer)
	fmt.Printf("helm: %v\n", helmVersion.GetVersion())
}
