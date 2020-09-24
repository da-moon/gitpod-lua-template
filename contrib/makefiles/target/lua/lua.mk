LUA_VERSION=$(shell lua -v | grep -Po '\d\.\d')
.PHONY: init-lua
.SILENT: init-lua
init-lua:
	- $(call print_running_target)
	- $(eval command=luarocks init --lua-versions='$(LUA_VERSION)' > /dev/null 2>&1)
	- $(eval command=$(command))
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) shell cmd="${command}"
	- $(call print_completed_target)

.PHONY: run-lua
.SILENT: run-lua
run-lua:
	- $(call print_running_target)
	- $(eval command=lua bin/project)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) shell cmd="${command}"
	- $(call print_completed_target)
