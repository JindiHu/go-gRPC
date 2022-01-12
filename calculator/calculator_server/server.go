package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"jindi/go-grpc/calculator/calculatorpb"

	"google.golang.org/grpc"
)

type server struct{}

func (s *server) Sum(ctx context.Context, req *calculatorpb.SumRequest) (*calculatorpb.SumResponse, error) {
	fmt.Println("Doing Sum calculation...")
	result := req.FirstNumber + req.SecondNumber

	res := &calculatorpb.SumResponse{
		SumResult: result,
	}
	return res, nil
}

func main() {
	fmt.Println("Calculator server starting...")

	lis, err := net.Listen("tcp", "0.0.0.0:8000")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	s := grpc.NewServer()
	calculatorpb.RegisterCalculatorServiceServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
