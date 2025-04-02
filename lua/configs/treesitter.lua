local options = {
    ensure_installed = {
        "bash",
        "fish",
        "lua",
        "luadoc",
        "printf",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "python",
        "nix",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
