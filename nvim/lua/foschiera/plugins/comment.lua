-- local status, comment = pcall(require, "Comment")
-- if (not status) then return end

return {
  "numToStr/Comment.nvim",

  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- enable comment
    comment.setup()
  end,
}
