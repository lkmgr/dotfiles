local icons = require "config.icons"

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", config = true },
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require "mason"
      local mason_lspconfig = require "mason-lspconfig"
      local lspconfig = require "lspconfig"

      mason.setup {
        ui = {
          border = "single",
        },
      }

      mason_lspconfig.setup {
        ensure_installed = {
          "bashls",
          "cssls",
          -- "denols",
          -- "docker_compose_language_service",
          "dockerls",
          "eslint",
          "html",
          "jsonls",
          "lua_ls",
          -- "stylua",
          "taplo",
          "tsserver",
          "yamlls",
        },
        automatic_installation = true,
      }

      local signs = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warn },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.WARN },
          spacing = 4,
          prefix = "●",
        },
        underline = {
          severity = { min = vim.diagnostic.severity.WARN },
        },
        update_in_insert = true,
        severity_sort = true,
        float = {
          focusable = false,
          -- style = "minimal",
          -- border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup_handlers {
        function(server)
          local old_on_attach = lspconfig[server].on_attach

          local opts = {
            on_attach = function(client, bufnr)
              if old_on_attach then old_on_attach(client, bufnr) end
              require("config.keymaps").lsp_buf_mappings(client, bufnr)

              if server == "eslint" then
                require("util.format").setup_eslint_autocmd(client, bufnr)
              else
                require("util.format").setup_autocmd(client, bufnr)
              end
            end,
            capabilities = vim.tbl_deep_extend("force", capabilities, lspconfig[server].capabilities or {}),
          }

          local present, server_overrides = pcall(require, "config.server-settings." .. server)
          if present then opts = vim.tbl_deep_extend("force", server_overrides, opts) end

          lspconfig[server].setup(opts)
        end,
      }
    end,
  },
}
