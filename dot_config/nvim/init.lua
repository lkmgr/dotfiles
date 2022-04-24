-- Install packer

-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require "core.options"
require "core.plugins"
require "core.autocmds"
require "core.mappings"

--Remap space as leader key
--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
--vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
--local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
--vim.api.nvim_create_autocmd('TextYankPost', {
--  callback = function()
--    vim.highlight.on_yank()
--  end,
--  group = highlight_group,
--  pattern = '*',
--})

--Map blankline
--vim.g.indent_blankline_char = '┊'
--vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
--vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
--vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
--require('gitsigns').setup {
--  signs = {
--    add = { text = '+' },
--    change = { text = '~' },
--    delete = { text = '_' },
--    topdelete = { text = '‾' },
--    changedelete = { text = '~' },
--  },
--}

-- Telescope
--require('telescope').setup {
--  defaults = {
--    mappings = {
--      i = {
--        ['<C-u>'] = false,
--        ['<C-d>'] = false,
--      },
--    },
--  },
--}

-- Enable telescope fzf native
--require('telescope').load_extension 'fzf'

--Add leader shortcuts
--vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
--vim.keymap.set('n', '<leader>sf', function()
--  require('telescope.builtin').find_files { previewer = false }
--end)
--vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
--vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
--vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
--vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
--vim.keymap.set('n', '<leader>so', function()
--  require('telescope.builtin').tags { only_current_buffer = true }
--end)
--vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
--require('nvim-treesitter.configs').setup {
--  highlight = {
--    enable = true, -- false will disable the whole extension
--  },
--  incremental_selection = {
--    enable = true,
--    keymaps = {
--      init_selection = 'gnn',
--      node_incremental = 'grn',
--      scope_incremental = 'grc',
--      node_decremental = 'grm',
--    },
--  },
--  indent = {
--    enable = true,
--  },
--  textobjects = {
--    select = {
--      enable = true,
--      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--      keymaps = {
--        -- You can use the capture groups defined in textobjects.scm
--        ['af'] = '@function.outer',
--        ['if'] = '@function.inner',
--        ['ac'] = '@class.outer',
--        ['ic'] = '@class.inner',
--      },
--    },
--    move = {
--      enable = true,
--      set_jumps = true, -- whether to set jumps in the jumplist
--      goto_next_start = {
--        [']m'] = '@function.outer',
--        [']]'] = '@class.outer',
--      },
--      goto_next_end = {
--        [']M'] = '@function.outer',
--        [']['] = '@class.outer',
--      },
--      goto_previous_start = {
--        ['[m'] = '@function.outer',
--        ['[['] = '@class.outer',
--      },
--      goto_previous_end = {
--        ['[M'] = '@function.outer',
--        ['[]'] = '@class.outer',
--      },
--    },
--  },
--}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
--local lspconfig = require 'lspconfig'
--local on_attach = function(_, bufnr)
--  local opts = { buffer = bufnr }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
--  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--  vim.keymap.set('n', '<leader>wl', function()
--    vim.inspect(vim.lsp.buf.list_workspace_folders())
--  end, opts)
--  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
--  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
--  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
--end

-- nvim-cmp supports additional completion capabilities
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
--local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
--for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--  }
--end

-- Example custom server
-- Make runtime files discoverable to the server
--local runtime_path = vim.split(package.path, ';')
--table.insert(runtime_path, 'lua/?.lua')
--table.insert(runtime_path, 'lua/?/init.lua')

--lspconfig.sumneko_lua.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--        -- Setup your lua path
--        path = runtime_path,
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = { 'vim' },
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = vim.api.nvim_get_runtime_file('', true),
--      },
--      -- Do not send telemetry data containing a randomized but unique identifier
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
--}

-- luasnip setup
--local luasnip = require 'luasnip'

-- nvim-cmp setup
--local cmp = require 'cmp'
--cmp.setup {
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert({
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<CR>'] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = true,
--    },
--    ['<Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--  }),
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  },
--}
-- vim: ts=2 sts=2 sw=2 et
