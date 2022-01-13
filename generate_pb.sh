export GO_PATH=~/go
export PATH=$PATH:/$GO_PATH/bin

echo "Generating proto buffer service code..."

protoc --go_out=. --go_opt=paths=source_relative \
  --go-grpc_out=. --go-grpc_opt=paths=source_relative --go-grpc_opt=require_unimplemented_servers=false \
  greet/greetpb/greet.proto
protoc --go_out=. --go_opt=paths=source_relative \
  --go-grpc_out=. --go-grpc_opt=paths=source_relative --go-grpc_opt=require_unimplemented_servers=false \
  calculator/calculatorpb/calculator.proto

echo "gRPC generated!"