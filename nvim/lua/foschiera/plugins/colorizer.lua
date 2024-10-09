-- local status, colorizer = pcall(require, "colorizer")
-- if (not status) then return end

return {
    "NvChad/nvim-colorizer.lua",

    config = function()

        local colorizer = require("colorizer")

        colorizer.setup()

    end
}
