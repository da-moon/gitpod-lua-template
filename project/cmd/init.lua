local pl_app = require "pl.lapp"
local log = require "project.log"
local meta = require "project.meta"
log.level = "warn"
local options = [[
 --v              verbose
 --vv             debug
]]

local cmds_arr = {}
local cmds = {
    hello=true,
    version = true,
}

for k in pairs(cmds) do
  cmds_arr[#cmds_arr+1] = k
end

table.sort(cmds_arr)

local help = string.format([[
Usage: project COMMAND [OPTIONS]

The available commands are:
 %s

Options:
%s]], table.concat(cmds_arr, "\n "), options)

return function(args)
  local cmd_name = table.remove(args, 1)
  if not cmd_name then
    pl_app(help)
    pl_app.quit()
  elseif not cmds[cmd_name] then
    pl_app(help)
    pl_app.quit("No such command: " .. cmd_name)
  end
  local cmd = require("project.cmd." .. cmd_name)
  local cmd_lapp = cmd.lapp
  local cmd_exec = cmd.execute

  if cmd_lapp then
    -- append universal options
    cmd_lapp = cmd_lapp .. options
    args = pl_app(cmd_lapp)
  end

  -- check sub-commands
  if cmd.sub_commands then
    local sub_cmd = table.remove(args, 1)
    if not sub_cmd then
      pl_app.quit()
    elseif not cmd.sub_commands[sub_cmd] then
      pl_app.quit("No such command for " .. cmd_name .. ": " .. sub_cmd)
    else
      args.command = sub_cmd
    end
  end
  -- verbose mode
  if args.v then
    log.level = "info"
  elseif args.vv then
    log.level = "debug"
  end

  log.info(string.format("Project v%s", meta._VERSION))
  log.info(string.format("Lua : %s", jit and jit.version or _VERSION))
  xpcall(function() cmd_exec(args) end, function(err)
    if not (args.v or args.vv) then
      err = err:match "^.-:.-:.(.*)$"
      io.stderr:write("Error: " .. err .. "\n")
      io.stderr:write("\n  Run with --v (info) or --vv (debug) for more details\n")
    else
      local trace = debug.traceback(err, 2)
      io.stderr:write("Error: \n")
      io.stderr:write(trace .. "\n")
    end
    pl_app.quit(nil, true)
  end)
end
