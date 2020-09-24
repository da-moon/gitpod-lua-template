local meta = require "project.meta"

local lapp = [[
Usage: project version [OPTIONS]

Print project's version. With the -a option, will print
the version of all underlying dependencies.

Options:
 -a,--all         get version of all dependencies
]]

local str = [[
Project: %s
Lua: %s]]

local function execute(args)
  if args.all then
    print(string.format(str,
      meta._VERSION,
      jit and jit.version or _VERSION
    ))
  else
    print(meta._VERSION)
  end
end

return {
  lapp = lapp,
  execute = execute
}
