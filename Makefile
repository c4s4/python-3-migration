BUILD_DIR=build
TITLE=Faut-il passer à Python 3 ?
DESTINATION=casa@sweetohm.net:/home/web/slides/python-3-migration
PYTHON_2=/opt/python/2.7.10/bin/python
PYTHON_3=/opt/python/3.5.0/bin/python

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

all: clean examples slides publish

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)

slides:
	@echo "$(YELLOW)Generating slides$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	cp res/template.html $(BUILD_DIR)/index.html
	sed -i -e "s/<? TITLE ?>/$(TITLE)/g" $(BUILD_DIR)/index.html
	sed -i -e "/<? CONTENT ?>/{r readme.md" -e "d}" $(BUILD_DIR)/index.html
	cp -r res/ img/ $(BUILD_DIR)

publish:
	@echo "$(YELLOW)Publishing slides$(CLEAR)"
	rsync -av $(BUILD_DIR)/ $(DESTINATION)/

examples:
	@echo "$(YELLOW)Running example code$(CLEAR)"
	@echo "############################ PYTHON 2 ############################"
	$(PYTHON_2) src/python-2.py
	@echo "############################ PYTHON 3 ############################"
	$(PYTHON_3) src/python-3.py

help:
	@echo "$(YELLOW)This makefile has following targets:$(CLEAR)"
	@echo "$(CYAN)help$(CLEAR)    To print this help page"
	@echo "$(CYAN)slides$(CLEAR)  To generate slides in $(BUILD_DIR) directory"
	@echo "$(CYAN)clean$(CLEAR)   To clean generated files in $(BUILD_DIR) directory"
	@echo "$(CYAN)publish$(CLEAR) To publish slides with rsync"
