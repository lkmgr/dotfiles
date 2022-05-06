return {
  init_options = {
    hostInfo = "neovim",
    preferences = {
      disable_suggestions = true,
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}
