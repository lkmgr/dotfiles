local M = {}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local utils = require "core.utils"
  -- local colors = require("catppuccin.palettes").get_palette()

  lualine.setup {
    options = {
      theme = "nordfox",
      component_separators = "|",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline", "alpha" },
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {
        {
          function()
            return " "
          end,
          separator = "",
          padding = { left = 1, right = 0 },
        },
        { "mode", padding = 1 },
      },
      lualine_b = {
        { "filename", path = 1, shorting_target = 70 },
      },
      lualine_c = { "branch", "diagnostics", "diff" },
      lualine_x = {
        {
          function()
            local buf_client_names = {}
            for _, client in pairs(vim.lsp.buf_get_clients(0)) do
              if client.name == "null-ls" then
                vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "FORMATTING"))
                vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "DIAGNOSTICS"))
              else
                table.insert(buf_client_names, client.name)
              end
            end
            return table.concat(buf_client_names, ", ")
          end,
          icon = "  LSP:",
          -- color = { fg = colors.mauve },
          color = { fg = "#c4a7e7" },
        },
      },
      lualine_y = { "filetype" },
      lualine_z = {
        { "location", icon = "", separator = "", padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-dap-ui", "toggleterm" },
  }
end

return M
