local M = {}

function M.config()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local show = which_key.show
  which_key.show = function(keys, opts)
    if vim.bo.filetype ~= "TelescopePrompt" then
      show(keys, opts)
    end
  end

  which_key.setup {
    window = {
      border = "single",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 35 },
      width = { min = 20, max = 50 },
      spacing = 5,
      align = "left",
    },
    key_labels = {
      ["<space>"] = "<SPC>",
      ["<cr>"] = "<RET>",
      ["<tab>"] = "<TAB>",
    },
  }

  which_key.register({
    d = { name = "DAP" },
    g = { name = "Git" },
    l = {
      name = "LSP",
      w = { name = "Workspace Folders" },
    },
    p = { name = "Packer" },
    s = { name = "Telescope" },
    t = { name = "Trouble" },
    z = { name = "Misc" },
  }, {
    prefix = "<leader>",
  })
end

return M
