return
-- codeactions
{
  'kosayoda/nvim-lightbulb',
  opts = {
    action_kinds = {
      "quickfix", "refactor",
    },
    autocmd = { enabled = true },
  },
  event = "VeryLazy"
}
