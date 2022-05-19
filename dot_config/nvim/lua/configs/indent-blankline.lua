local M = {}

function M.config()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  -- OneDarkPro purple
  -- vim.cmd [[highlight IndentBlanklineContextChar guifg=#c678dd gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextStart guisp=#c678dd gui=underline]]

  indent_blankline.setup {
    char = "▏",
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
    indent_level = 20,
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
      "Trouble",
    },
    context_patterns = {
      "class",
      "^func",
      "method",
      "^if",
      "^while",
      "^for",
      "with",
      "try",
      "except",
      "arguments",
      "argument_list",
      "^object",
      "dictionary",
      "element",
      "^table",
      "tuple",
      "do_block",
      "return",
      "jsx_element",
      "block",
      "if_statement",
      "else_clause",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
  }
end

return M
