package = "gitpod-lua-template"
version = "dev-1"
supported_platforms = {"linux"}

source = {
   url = "git+https://github.com/da-moon/gitpod-lua-template.git"
}
description = {
   homepage = "https://github.com/da-moon/gitpod-lua-template",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua ~> 5.3",
   "penlight ~> 1.7.0",
    "lua-ffi-zlib ~> 0.5"

}
build = {
    type = "builtin",
    modules = {
        ["project"] = "project/init.lua",
        ["project.constants"] = "project/constants.lua",
        ["project.meta"] = "project/meta/init.lua",
        ["project.log"] = "project/log/init.lua",
        ["project.env"] = "project/env/init.lua",
        ["project.kill"] = "project/kill/init.lua",
        ["project.cmd"] = "project/cmd/init.lua",
        ["project.cmd.hello"] = "project/cmd/hello.lua",
        ["project.cmd.version"] = "project/cmd/version.lua",
    }
}
