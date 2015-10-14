BUILD_DIR=build
PYTHON_2=/opt/python/2.7.10/bin/python
PYTHON_3=/opt/python/3.5.0/bin/python

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

all: clean examples slides publish

slides: clean
	@echo "$(YELLOW)Generating slides$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	cp template.html $(BUILD_DIR)/index.html
	sed -i -e "/<? CONTENT ?>/{r readme.md" -e "d}" $(BUILD_DIR)/index.html
	cp -r img/ $(BUILD_DIR)

publish:
	@echo "$(YELLOW)Publishing slides$(CLEAR)"
	rsync -av build/ casa@sweetohm.net:/home/web/sweetohm/talks/python-3-migration/

examples:
	@echo "$(YELLOW)Running example code$(CLEAR)"
	@echo "############################ PYTHON 2 ############################"
	$(PYTHON_2) src/python-2.py
	@echo "############################ PYTHON 3 ############################"
	$(PYTHON_3) src/python-3.py

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf build/
