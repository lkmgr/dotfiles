local M = {}

function M.setup()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  comment.setup({
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
      line = 'gcc',
      block = 'gbc',
    },

    opleader = {
      line = 'gc',
      block = 'gb',
    },

    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },

    mappings = {
      ---Operator-pending mapping
      ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
      ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
      basic = true,
      ---Extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = true,
      ---Extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
  })
end

return M

