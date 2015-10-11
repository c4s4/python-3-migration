BUILD_DIR=build

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

slides: clean
	@echo "$(YELLOW)Generating slides$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	cp template.html $(BUILD_DIR)/index.html
	sed -i -e "/<? CONTENT ?>/{r readme.md" -e "d}" $(BUILD_DIR)/index.html
	cp -r img/ $(BUILD_DIR)

publish:
	@echo "$(YELLOW)Publishing slides$(CLEAR)"
	rsync -av build/ casa@sweetohm.net:/home/web/sweetohm/talks/python-3-migration/
	

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf build/
