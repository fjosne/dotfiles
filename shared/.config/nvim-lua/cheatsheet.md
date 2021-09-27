# Vimscript to Lua

## `vim.api.nvim_eval(<vimscript expr>: string)`

Evaluates a vimscript expression (as a string value) and returns the value. Data types of return values are automatically 
converted to its lua equivalents.

Example:
```lua
vim.api.nvim_eval('[1, 2, 3]') -- { 1, 2, 3 }, vimscript list to Lua table
vim.api.nvim_eval('{"foo": "bar", "baz": "qux"}') -- {foo = "bar", baz = "qux"}, vimscript dictionary to Lua table
vim.api.nvim_eval('v:null') -- nil
```

## `vim.api.nvim_exec(<vimscript chunk>: string, return_output: boolean)`

Evaluates a chunk of vimscript code (as a string value). It also takes a boolean to determine wether the output of the
code should be returned by `vim.api.nvim_exec`.

Example:
```lua
local result = vim.api.nvim_exec(
[[
let mytext = 'hello world'

function! MyFunction(text)
    echo a:text
endfunction

call MyFunction(mytext)
]], true)

print(result) -- 'hello world'
```

## `vim.api.nvim_command(<ex command>: string)` and `vim.cmd(<ex command>: string)`

Executes an ex-command. `vim.cmd()` is shorthand for `vim.api.nvim_command()`.

Example:
```lua
vim.api.nvim_command('new')
vim.api.nvim_command('wincmd H')
vim.api.nvim_command('set nonumber')
vim.api.nvim_command('%s/foo/bar/g')
```

### Tips

Since the parameters of these functions are strings, you often have to escape backslashes. Using literal strings are
easier to use as they do not require escaping characters.

```lua
vim.cmd('%s/\\Vfoo/bar/g') -- Regular string
vim.cmd([[%s/\Vfoo/bar/g]]) -- Literal string
```
