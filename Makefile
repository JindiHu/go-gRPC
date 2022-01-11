deps:
	go mod vendor -v
	go mod tidy -v
	
run: 
	go run cmd/svc-auth/main.go

gen:
	protoc --proto_path=greet/greetpb/ --go_out=greet/greetpb/ --go_opt=paths=source_relative greet.proto