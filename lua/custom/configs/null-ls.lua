local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- spell check
  b.diagnostics.cspell.with {
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity.HINT
    end,
  },
  b.code_actions.cspell,

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choose deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- json
  b.formatting.fixjson,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
