local M = {}

M.config = function()
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  }

  local status_ok, trouble = pcall(require, "trouble.providers.telescope")
  if status_ok then
    lvim.builtin.telescope.defaults.mappings.i["<C-y>"] = trouble.open_with_trouble
    lvim.builtin.telescope.defaults.mappings.n["<C-y>"] = trouble.open_with_trouble
  end
end

return M

