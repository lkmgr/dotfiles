local function create_sops_command(action)
  return function()
    local current_file = vim.fn.expand("%")
    local command = string.format("sops %s -i %s", action, current_file)
    vim.fn.system(command)
    vim.cmd("edit!")
  end
end

vim.api.nvim_create_user_command("SopsDecrypt", create_sops_command("-d"), {
  desc = "Decrypt the current file using sops",
  force = false,
})

vim.api.nvim_create_user_command("SopsEncrypt", create_sops_command("-e"), {
  desc = "Encrypt the current file using sops",
  force = false,
})
