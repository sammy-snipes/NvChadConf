-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
    transparency = true,
    -- opacity = 1.0,
}
M.plugins = {
    override = {
        ["nvim-telescope/telescope.nvim"] = {
            defaults = {
                change_dir = false,
            },
        },
    },
}
return M
