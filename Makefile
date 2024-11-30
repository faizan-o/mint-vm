# Compiler and flags
CC = gcc
CFLAGS = -pipe -Iinclude -Wall -Wextra -g

# Directories
SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build
INCLUDE_DIR = include

# Target executable
TARGET = $(BUILD_DIR)/vm.exe

# Source files and object files
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

# Default target
all: $(TARGET)

# Create necessary directories
$(OBJ_DIR) $(BUILD_DIR):
	mkdir -p $@

# Compile the target
$(TARGET): $(OBJ_DIR) $(BUILD_DIR) $(OBJ_FILES) main.c
	$(CC) $(CFLAGS) main.c $(OBJ_FILES) -o $@

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(OBJ_DIR) $(BUILD_DIR)

# Phony targets
.PHONY: all clean
