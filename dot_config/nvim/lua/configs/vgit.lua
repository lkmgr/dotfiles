local M = {}

function M.config()
  local status_ok, vgit = pcall(require, "vgit")
  if not status_ok then
    return
  end

  vgit.setup {
    keymaps = {
      ["n <leader>gk"] = "hunk_up",
      ["n <leader>gj"] = "hunk_down",
      ["n <leader>gs"] = "buffer_hunk_stage",
      ["n <leader>gr"] = "buffer_hunk_reset",
      ["n <leader>gp"] = "buffer_hunk_preview",
      ["n <leader>gb"] = "buffer_blame_preview",
      ["n <leader>gf"] = "buffer_diff_preview",
      ["n <leader>gh"] = "buffer_history_preview",
      ["n <leader>gu"] = "buffer_reset",
      ["n <leader>gg"] = "buffer_gutter_blame_preview",
      ["n <leader>glu"] = "project_hunks_preview",
      ["n <leader>gls"] = "project_hunks_staged_preview",
      ["n <leader>gd"] = "project_diff_preview",
      ["n <leader>gq"] = "project_hunks_qf",
      ["n <leader>gx"] = "toggle_diff_preference",
    },
    settings = {
      hls = {
        GitBackground = "Normal",
        GitHeader = "NormalFloat",
        GitFooter = "NormalFloat",
        GitBorder = "LineNr",
        GitLineNr = "LineNr",
        GitComment = "Comment",
        GitSignsAdd = {
          gui = nil,
          fg = "#d7ffaf",
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsChange = {
          gui = nil,
          fg = "#7AA6DA",
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsDelete = {
          gui = nil,
          fg = "#e95678",
          bg = nil,
          sp = nil,
          override = false,
        },
        GitSignsAddLn = "DiffAdd",
        GitSignsDeleteLn = "DiffDelete",
        GitWordAdd = {
          gui = nil,
          fg = nil,
          bg = "#5d7a22",
          sp = nil,
          override = false,
        },
        GitWordDelete = {
          gui = nil,
          fg = nil,
          bg = "#960f3d",
          sp = nil,
          override = false,
        },
      },
      live_blame = {
        enabled = true,
      },
      live_gutter = {
        enabled = true,
        edge_navigation = true, -- This allows users to navigate within a hunk
      },
      authorship_code_lens = {
        enabled = true,
      },
      scene = {
        diff_preference = "unified",
      },
      diff_preview = {
        keymaps = {
          buffer_stage = "S",
          buffer_unstage = "U",
          buffer_hunk_stage = "s",
          buffer_hunk_unstage = "u",
          toggle_view = "t",
        },
      },
      project_diff_preview = {
        keymaps = {
          buffer_stage = "s",
          buffer_unstage = "u",
          buffer_hunk_stage = "gs",
          buffer_hunk_unstage = "gu",
          buffer_reset = "r",
          stage_all = "S",
          unstage_all = "U",
          reset_all = "R",
        },
      },
      signs = {
        priority = 10,
        -- definitions = {
        --   GitSignsAddLn = {
        --     linehl = "GitSignsAddLn",
        --     texthl = nil,
        --     numhl = nil,
        --     icon = nil,
        --     text = "",
        --   },
        --   GitSignsDeleteLn = {
        --     linehl = "GitSignsDeleteLn",
        --     texthl = nil,
        --     numhl = nil,
        --     icon = nil,
        --     text = "",
        --   },
        --   GitSignsAdd = {
        --     texthl = "GitSignsAdd",
        --     numhl = nil,
        --     icon = nil,
        --     linehl = nil,
        --     text = "┃",
        --   },
        --   GitSignsDelete = {
        --     texthl = "GitSignsDelete",
        --     numhl = nil,
        --     icon = nil,
        --     linehl = nil,
        --     text = "┃",
        --   },
        --   GitSignsChange = {
        --     texthl = "GitSignsChange",
        --     numhl = nil,
        --     icon = nil,
        --     linehl = nil,
        --     text = "┃",
        --   },
        -- },
        usage = {
          screen = {
            add = "GitSignsAddLn",
            remove = "GitSignsDeleteLn",
          },
          main = {
            add = "GitSignsAdd",
            remove = "GitSignsDelete",
            change = "GitSignsChange",
          },
        },
      },
      symbols = {
        void = "⣿",
      },
    },
  }
end

return M
