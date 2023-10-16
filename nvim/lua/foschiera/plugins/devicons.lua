-- local status, icons = pcall(require, "nvim-web-devicons")
-- if (not status) then return end

return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local icons = require("nvim-web-devicons")
    icons.set_icon({
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
    })
  end,
}
