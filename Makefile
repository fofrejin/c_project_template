# Compiler
CC = gcc
# Optimization flags
OPT = -O0 -g
# Compiler flags
CFLAGS += $(OPT)
CFLAGS += -Wall
CFLAGS += -Werror
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -fshort-enums
CFLAGS += -fno-strict-aliasing
# Linker flags
LDFLAGS += $(OPT)
LDFLAGS += -Wl,--gc-sections
LDFLAGS += -Wl,--cref
LDFLAGS += -Wl,--print-memory-usage
# Build directories
BUILD_DIR = _build
OBJ_DIR = $(BUILD_DIR)/obj
# Source files
SRCS_DIR = src
SRCS += $(SRCS_DIR)/main.c
# Include directories
INC_DIRS += 
CFLAGS += $(addprefix -I,$(INC_DIRS))
# Object files
OBJS = $(patsubst $(SRCS_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))
# Executable name
EXEC_NAME = c_project_template
TARGET = $(BUILD_DIR)/$(EXEC_NAME)

# Default target
all: $(TARGET)

# Linking step
$(TARGET): $(OBJS) | $(BUILD_DIR)
	@echo [Linking $@]
	@$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET) -Wl,-Map,$(TARGET).map
	@echo [Size]
	-@size $(TARGET)

# Compilation step
$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.c | $(OBJ_DIR)
	@echo [Compiling $<]
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

# Ensure build directories exist
$(BUILD_DIR) $(OBJ_DIR):
	@mkdir -p $@

# Run the target
run: all
	@echo [Running $(TARGET)]
	@./$(TARGET)

# Clean up build files
clean:
	rm -rf $(BUILD_DIR)

format:
	find ./src -iname *.[hc] -exec clang-format-18 -i {} \;

format_dry_run:
	find ./src -iname *.[hc] -exec clang-format-18 -i --dry-run -Werror {} \;

# Phony targets
.PHONY: all clean format format_dry_run
