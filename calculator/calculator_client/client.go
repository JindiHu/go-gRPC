package main

import (
	"context"
	"fmt"
	"jindi/go-grpc/calculator/calculatorpb"
	"log"

	"google.golang.org/grpc"
)

func main() {
	fmt.Println("Calculator client")

	cc, err := grpc.Dial("localhost:8000", grpc.WithInsecure())
	if err != nil {
		log.Fatalf("Failed to connect: %v", err)
	}

	defer cc.Close()

	c := calculatorpb.NewCalculatorServiceClient(cc)

	req := &calculatorpb.SumRequest{
		FirstNumber:  1,
		SecondNumber: 2,
	}

	res, err := c.Sum(context.Background(), req)

	if err != nil {
		log.Fatalf("Error while calling Greet RPC: %v", err)
	}

	log.Printf("Response from Greet: %v", res.SumResult)
}
