local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck", "flake8" },
    python = { "mypy", "ruff" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
    "reload",
    "--",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
