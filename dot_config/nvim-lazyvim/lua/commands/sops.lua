local function sops_decrypt()
  local current_file = vim.fn.expand("%")
  local command = string.format("sops -d -i %s", current_file)
  vim.fn.system(command)
  vim.cmd("edit!")
end

local function sops_encrypt()
  local current_file = vim.fn.expand("%")
  local command = string.format("sops -e -i %s", current_file)
  vim.fn.system(command)
  vim.cmd("edit!")
end

vim.api.nvim_create_user_command("SopsDecrypt", sops_decrypt, {
  desc = "Decrypt the current file using sops",
  force = false,
})

vim.api.nvim_create_user_command("SopsEncrypt", sops_encrypt, {
  desc = "Encrypt the current file using sops",
  force = false,
})
