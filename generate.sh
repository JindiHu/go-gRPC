#!/bin/bash

protoc --proto_path=greet/greetpb/ --go_out=greet/greetpb/ --go_opt=paths=source_relative greet.proto
# protoc calculator/calculatorpb/calculator.proto --go_out=plugins=grpc:.
# protoc blog/blogpb/blog.proto --go_out=plugins=grpc:.