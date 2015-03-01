# Commands
COMPILE_CMD = node_modules/.bin/babel

# Directories
LIB_DIR = lib/
DIST_DIR = dist/
TEST_DIR = test/

.PHONY: all compile-lib compile-test clean

all: compile-lib compile-test

compile-lib:
	mkdir -p $(DIST_DIR)$(LIB_DIR)
	$(COMPILE_CMD) --optional runtime $(LIB_DIR) \
		--out-dir $(DIST_DIR)$(LIB_DIR)

compile-test:
	mkdir -p $(DIST_DIR)$(TEST_DIR)
	cp -r $(TEST_DIR)examples/ $(DIST_DIR)$(TEST_DIR)examples/
	$(COMPILE_CMD) --optional runtime $(TEST_DIR)index.js \
		--out-file $(DIST_DIR)$(TEST_DIR)index.js

clean:
	rm -rf $(DIST_DIR)
