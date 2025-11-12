package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello world from Kubernetes!! This is Go web server running in minikube.")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server is running on port 9090... ")
	http.ListenAndServe(":9090", nil)
}
