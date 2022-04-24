local M = {}

function M.config()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  -- OneDarkPro purple
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#c678dd gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineContextStart guisp=#c678dd gui=underline]]

  indent_blankline.setup {
    char = "▏",
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
    buftype_exclude = {
      "nofile",
      "terminal",
      "quickfix",
      "lsp-installer",
      "lspinfo",
    },
    filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "NvimTree",
      "neo-tree",
      "dashboard",
      "Outline",
      "alpha",
      "help",
      "Trouble",
      "packer",
      "Trouble",
    },
  }
end

return M

