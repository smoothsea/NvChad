local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- php
  b.formatting.phpcsfixer,

  -- js
  b.formatting.deno_fmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
