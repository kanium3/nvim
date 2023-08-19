return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { 'BufNewFile', 'BufRead' },
    opts = {
        highlight = {
            enable = true
        }
    }
}
