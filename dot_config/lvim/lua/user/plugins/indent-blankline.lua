local M = {}

M.config = function()
  local status_ok, indent_blankline = pcall(require, "indent-blankline")
  if not status_ok then
    return
  end

  indent_blankline.setup {
    char = "▏",
    filetype_exclude = {"help", "terminal", "dashboard"},
    buftype_exclude = {"terminal"},
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    -- char_highlight_list = {
    --   "IndentBlanklineIndent1",
    --   "IndentBlanklineIndent2",
    --   "IndentBlanklineIndent3",
    --   "IndentBlanklineIndent4",
    --   "IndentBlanklineIndent5",
    --   "IndentBlanklineIndent6",
    -- },
  }
end

return M

