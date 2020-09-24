
local foo_map = {
  one = "one-value",
  two = "two-value",
}
local foo = {}
for p,_ in pairs(foo_map) do
  foo[#foo + 1] = p
end
table.sort(foo)
local constants = {
  FOO = foo,
}
return constants
