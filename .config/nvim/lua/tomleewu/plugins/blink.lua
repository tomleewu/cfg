return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- On musl libc based systems you need to add this flag
  -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

  opts = {
    keymap = {
      accept = "<CR>",
      select_prev = { '<Up>', '<C-k>' },
      select_next = { '<Down>', '<C-j>' },
    },
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    accept = {
      create_undo_point = true,
      auto_brackets = {
        enabled = true,
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {},
        -- Overrides the default blocked filetypes
        force_allow_filetypes = {},
        blocked_filetypes = {},
        -- Synchronously use the kind of the item to determine if brackets should be added
        kind_resolution = {
          enabled = true,
          blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
        },
        -- Asynchronously use semantic token to determine if brackets should be added
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = {},
          -- How long to wait for semantic tokens to return before assuming no brackets should be added
          timeout_ms = 400,
        },
      },
    },
    trigger = {
      completion = {
        -- 'prefix' will fuzzy match on the text before the cursor
        -- 'full' will fuzzy match on the text before *and* after the cursor
        -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
        keyword_range = 'prefix',
        -- regex used to get the text when fuzzy matching
        -- changing this may break some sources, so please report if you run into issues
        -- todo: shouldnt this also affect the accept command? should this also be per language?
        keyword_regex = '[%w_\\-]',
        -- after matching with keyword_regex, any characters matching this regex at the prefix will be excluded
        exclude_from_prefix_regex = '[\\-]',
        -- LSPs can indicate when to show the completion window via trigger characters
        -- however, some LSPs (*cough* tsserver *cough*) return characters that would essentially
        -- always show the window. We block these by default
        blocked_trigger_characters = { ' ', '\n', '\t' },
        -- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
        -- list of additional trigger characters that won't trigger the completion window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_blocked_trigger_characters = { "'", '"' },
        -- when false, will not show the completion window when in a snippet
        show_in_snippet = false,
      },
      signature_help = {
        enabled = false,
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
      },
    },

    windows = {
      autocomplete = {
        selection = 'auto_insert',
      }
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
  }
}
