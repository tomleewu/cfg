return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets', 'fang2hou/blink-copilot' },

  -- use a release tag to download pre-built binaries
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },

      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },


      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal'
    },
    completion = {
      ghost_text = {
        enabled = true,
      },
      list = {
        selection = {
          preselect = false,
        },
      },
      keyword = { range = 'full' },
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "source_name" }, },
        },
        direction_priority = { 'n', 's' },
      },
    },
    cmdline = {
      enabled = false,
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
  opts_extend = { "sources.default" }
}
