pcall(require, "luarocks.loader")

-- in case a package must be loaded, declare them here
-- assert(package.loaded["<package name>"], "error ... ")

-- load constants either from module.
local constants = require "project.constants"
do
--  just as sample, lets print values inside FOO
 for k, v in ipairs(constants.FOO) do
    print(string.format("constants.FOO - key : '%s' value :'%s'",k,v))
  end
end