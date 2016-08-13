package main // import "golang.org/dbrian/hello-go"

import (
	"io"
	"net/http"
	"os"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

func hello(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello world!")
}

func main() {

	r := mux.NewRouter()
	r.HandleFunc("/", hello)
	http.ListenAndServe(":80",
		handlers.CombinedLoggingHandler(os.Stdout, r))
}
