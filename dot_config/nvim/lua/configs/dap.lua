local M = {}

function M.config()
  local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    return
  end

  vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignWarning",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  })

  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
end

return M
