package main

import (
	"fmt"
	"runtime"
)

var buildOs string
var buildArch string
var buildTime string
var buildCommit string

func main() {
	fmt.Println("Hi, you're running a native executable!")
	fmt.Println("=======================================")
	fmt.Printf("Go: %s\n", runtime.Version())
	fmt.Printf("OS/Arch: %s/%s\n", buildOs, buildArch)
	fmt.Printf("Built: %s\n", buildTime)
	fmt.Printf("Commit: %s\n", buildCommit)
}
