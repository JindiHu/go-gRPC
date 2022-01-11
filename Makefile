deps:
	go mod vendor -v
	go mod tidy -v
	
run: 
	go run cmd/svc-auth/main.go
