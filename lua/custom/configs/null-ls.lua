local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local function has_eslint_rc(utils)
-- detect there are eslint config file under the root of the project
  return utils.root_has_file { ".eslintrc.js", ".eslintrc.json" }
end

local function has_package_json(utils)
  return utils.root_has_file { "package.json" }
end

local function has_prettier_rc(utils)
  return utils.root_has_file { ".prettierrc", ".prettierrc.js" }
end

local function should_format_with_eslint(utils)
  return has_package_json(utils) and has_eslint_rc(utils) and not has_prettier_rc(utils)
end

local function should_format_with_prettier(utils)
  return has_prettier_rc(utils) and has_package_json(utils)
end

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

  -- eslint
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
  b.formatting.eslint_d.with {
    condition = should_format_with_eslint,
  },
  b.formatting.prettierd.with {
    condition = should_format_with_prettier,
  },

  -- fish
  b.diagnostics.fish,
}

null_ls.setup {
  diagnostics_format = "[#{c}] #{m} (#{s})",
  debug = true,
  sources = sources,
}
