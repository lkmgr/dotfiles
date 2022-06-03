local M = {}

function M.config()
  local status_ok, icons = pcall(require, "nvim-web-devicons")
  if not status_ok then
    return
  end

  icons.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
      deb = { icon = "", name = "Deb" },
      graphql = { icon = "", name = "GraphQL" },
      lock = { icon = "", name = "Lock" },
      mp3 = { icon = "", name = "Mp3" },
      mp4 = { icon = "", name = "Mp4" },
      out = { icon = "", name = "Out" },
      ["robots.txt"] = { icon = "ﮧ", name = "Robots" },
      rpm = { icon = "", name = "Rpm" },
      ttf = { icon = "", name = "TrueTypeFont" },
      woff = { icon = "", name = "WebOpenFontFormat" },
      woff2 = { icon = "", name = "WebOpenFontFormat2" },
      xz = { icon = "", name = "Xz" },
      zip = { icon = "", name = "Zip" },
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
  }
end

return M
