local M = {}

function M.config()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
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
  }

  which_key.register({
    w = { "<cmd>w<CR>", "Save" },
    m = { "<cmd>noautocmd w<CR>", "Save without formatting" },
    q = { "<cmd>q<CR>", "Quit" },
    h = { "<cmd>nohl<CR>", "No Highlight" },
    e = { "<cmd>Neotree toggle<CR>", "Toggle Neotree" },
    o = { "<cmd>Neotree focus<CR>", "Focus Neotree" },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    l = {
      name = "LSP",
      a = { vim.lsp.buf.code_action, "Code Action" },
      d = { vim.diagnostic.open_float, "Hover Diagnostic" },
      f = { vim.lsp.buf.formatting_sync, "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      r = { vim.lsp.buf.rename, "Rename" },
    },

    g = {
      name = "Git",
      j = {
        function()
          require("gitsigns").next_hunk()
        end,
        "Next Hunk",
      },
      k = {
        function()
          require("gitsigns").prev_hunk()
        end,
        "Prev Hunk",
      },
      l = {
        function()
          require("gitsigns").blame_line()
        end,
        "Blame",
      },
      p = {
        function()
          require("gitsigns").preview_hunk()
        end,
        "Preview Hunk",
      },
      h = {
        function()
          require("gitsigns").reset_hunk()
        end,
        "Reset Hunk",
      },
      r = {
        function()
          require("gitsigns").reset_buffer()
        end,
        "Reset Buffer",
      },
      s = {
        function()
          require("gitsigns").stage_hunk()
        end,
        "Stage Hunk",
      },
      u = {
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        "Undo Stage Hunk",
      },
      d = {
        function()
          require("gitsigns").diffthis()
        end,
        "Diff",
      },
      g = {
        function()
          require("core.utils").toggle_term_cmd "lazygit"
        end,
        "Lazygit",
      },
    },

    s = {
      name = "Search",
      R = {
        function()
          require("telescope.builtin").oldfiles()
        end,
        "Open Recent File",
      },
      c = {
        function()
          require("telescope.builtin").commands()
        end,
        "Commands",
      },
      f = {
        function()
          require("telescope.builtin").find_files()
        end,
        "Find File",
      },
      h = {
        function()
          require("telescope.builtin").help_tags()
        end,
        "Find Help",
      },
      k = {
        function()
          require("telescope.builtin").keymaps()
        end,
        "Keymaps",
      },
      r = {
        function()
          require("telescope.builtin").registers()
        end,
        "Registers",
      },
      t = {
        function()
          require("telescope.builtin").live_grep()
        end,
        "Find Text",
      },
    },

    t = {
      name = "Trouble",
      t = { "<cmd>Trouble<CR>", "Open Trouble" },
      w = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
      e = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
      l = { "<cmd>Trouble loclist<CR>", "Location List" },
      q = { "<cmd>Trouble quickfix<CR>", "Quickfix" },
      d = { "<cmd>Trouble lsp_definitions<CR>", "LSP Definitions" },
      r = { "<cmd>Trouble lsp_references<CR>", "LSP References" },
    },

    z = {
      name = "Misc",
      f = { "<cmd>.!figlet<CR>", "Figlet" },
      s = { "<cmd>.!figlet -f small<CR>", "Figlet Small" },
    },
  }, {
    prefix = "<leader>",
    nowait = true,
  })
end

return M
