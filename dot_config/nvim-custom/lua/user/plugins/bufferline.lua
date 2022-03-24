local M = {}

function M.setup()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  bufferline.setup({
    options = {
      tab_size = 20,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        }
      },
    }
  })
end

return M

