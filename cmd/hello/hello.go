package main

import (
	"fmt"

	draftVersion "github.com/Azure/draft/pkg/version"
	helmVersion "k8s.io/helm/pkg/version"
	kubeVersion "k8s.io/kubernetes/pkg/version"
)

func main() {
	v := draftVersion.New()
	kv := kubeVersion.Get()
	fmt.Println("Draft Hello!")
	fmt.Printf("draft: %v\n", v.SemVer)
	fmt.Printf("kubernetes: %v\n", kv.String())
	fmt.Printf("helm: %v\n", helmVersion.GetVersion())
}
