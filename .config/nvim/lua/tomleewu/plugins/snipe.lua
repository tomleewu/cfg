return
{
  "leath-dub/snipe.nvim",
  keys = {
    { "gh", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" },
  },
  opts = {
    sort = "last",
    -- In case you changed your mind, provide a keybind that lets you
    -- cancel the snipe and close the window.
    navigate = {
      cancel_snipe = "q",
    },
    ui = {
      max_height = 10,
      position = "center",
    }
  }
}
