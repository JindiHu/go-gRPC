deps:
	go mod vendor -v
	go mod tidy -v
	
run: 
	go run cmd/svc-auth/main.go

gen:
	protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative greet/greetpb/greet.proto