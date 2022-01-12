deps:
	go mod vendor -v
	go mod tidy -v
	
run: 
	go run cmd/svc-auth/main.go

gen:
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative --go-grpc_opt=require_unimplemented_servers=false \
		greet/greetpb/greet.proto
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative --go-grpc_opt=require_unimplemented_servers=false \
		calculator/calculatorpb/calculator.proto