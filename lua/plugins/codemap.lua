return {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    event = { "BufReadPre", "BufNewFile" },
    init = function ()
        vim.g.minimap_width = 10
    end,
}
