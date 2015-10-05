BUILD_DIR=build

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

slides:
	@echo "$(YELLOW)Generating slides$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	cp template.html $(BUILD_DIR)/index.html
	sed -i -e "/<? CONTENT ?>/{r slides.md" -e "d}" $(BUILD_DIR)/index.html
	cp *.png $(BUILD_DIR)

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf build/
