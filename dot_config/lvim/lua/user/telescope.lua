local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.telescope.defaults.path_display = { shorten = 15 }

lvim.builtin.telescope.defaults.layout_strategy = "vertical"
-- lvim.builtin.telescope.defaults.layout_config.width = 0.85
lvim.builtin.telescope.defaults.layout_config.vertical = {
  width = 0.85,
}
