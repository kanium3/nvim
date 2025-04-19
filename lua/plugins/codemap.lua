return {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    keys = {
        { "<leader>mn", "<Cmd>MinimapToggle<CR>", desc = "Toggle minimap.vim" },
    },
    init = function()
        vim.g.minimap_width = 10
    end,
}
