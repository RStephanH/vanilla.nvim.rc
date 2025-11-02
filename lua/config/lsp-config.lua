vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

vim.lsp.enable('luals')

if vim.fn.executable("copilot-language-server") == 1 then
  vim.lsp.enable("copilot")
end

