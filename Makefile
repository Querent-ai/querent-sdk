# Makefile to generate Python and JavaScript SDKs from .proto files

# Variables
PROTO_DIR := ./protos
PYTHON_OUT_DIR := ./python_sdk
JS_OUT_DIR := ./js_sdk

# Protobuf files
PROTO_FILES := $(wildcard $(PROTO_DIR)/*.proto)

# Protoc Python plugin
PROTOC_PYTHON_PLUGIN := python_out
# For gRPC support, you might use something like `grpc_python_out` and ensure you have the gRPC plugin

# Protoc JavaScript plugin
# Depending on your setup, this might be `js_out` or something like `grpc-web_out`
PROTOC_JS_PLUGIN := js_out

# Default rule
all: python js

# Python SDK generation
python:
	@mkdir -p $(PYTHON_OUT_DIR)
	protoc -I=$(PROTO_DIR) --$(PROTOC_PYTHON_PLUGIN)=$(PYTHON_OUT_DIR) $(PROTO_FILES)

# JavaScript SDK generation
js:
	@mkdir -p $(JS_OUT_DIR)
	protoc -I=$(PROTO_DIR) --$(PROTOC_JS_PLUGIN)=$(JS_OUT_DIR) $(PROTO_FILES)

# Clean rule for cleaning up generated files
clean:
	rm -rf $(PYTHON_OUT_DIR)/* $(JS_OUT_DIR)/*

.PHONY: all python js clean
