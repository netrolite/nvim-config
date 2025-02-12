local on_attach = require("utils.lsp_on_attach")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    "saghen/blink.cmp"
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers_with_default_options = { "rust_analyzer", "marksman", "prismals", "pyright", "html", "ts_ls", "cssls",
      "tailwindcss", "taplo", "css_variables", "cssmodules_ls", "gopls", "svelte" }

    for _, server in ipairs(servers_with_default_options) do
      lspconfig[server].setup({ capabilities = capabilities, on_attach = on_attach })
    end

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      filetypes = { "css", "sass", "scss", "less" },
    })
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    local vscodeLsCapabilities = vim.lsp.protocol.make_client_capabilities()
    vscodeLsCapabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig["cssls"].setup({
      capabilities = vscodeLsCapabilities,
    })
    lspconfig["jsonls"].setup({
      capabilities = vscodeLsCapabilities,
    })
  end,
}
