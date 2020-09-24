# gitpod-lua-template

Lua project template for use inside gitpod


## tips

- use [`write-rockspec`](https://github.com/luarocks/luarocks/wiki/write_rockspec) to generate an initial rockspec file.

```bash
luarocks write-rockspec --lua-versions="$(lua -v | grep -Po '\d\.\d')"
```

- if needed, initialize with `luarocks init --lua-versions="$(lua -v | grep -Po '\d\.\d')`

- use `--pack-binary-rock` to build without installing

```bash
luarocks build --pack-binary-rock gitpod-lua-template-dev-1.rockspec
```

## references

- https://github.com/luarocks/luarocks/wiki/Creating-a-rock
- https://codingart.readthedocs.io/en/latest/lua/
- https://github.com/Kong/kong