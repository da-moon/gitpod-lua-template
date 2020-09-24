include vars.mk
include contrib/makefiles/pkg/base/base.mk
include contrib/makefiles/pkg/string/string.mk
include contrib/makefiles/pkg/color/color.mk
include contrib/makefiles/pkg/functions/functions.mk
include contrib/makefiles/target/git/git.mk
include contrib/makefiles/target/buildenv/buildenv.mk
include contrib/makefiles/target/lua/lua.mk
THIS_FILE := $(firstword $(MAKEFILE_LIST))
SELF_DIR := $(dir $(THIS_FILE))

.SILENT: init
.PHONY: init
init:
	- $(call print_running_target)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) init-lua
	- $(call print_completed_target)

.SILENT: build
.PHONY: build
build:
	- $(call print_running_target)
	- $(call print_completed_target)
.SILENT: run
.PHONY: run
run:
	- $(call print_running_target)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) run-lua
	- $(call print_completed_target)
.SILENT: clean
.PHONY: clean
clean:
	- $(call print_running_target)
	- $(call print_completed_target)
.SILENT: install
.PHONY: install
install: build
	- $(call print_running_target)
	- $(call print_completed_target)