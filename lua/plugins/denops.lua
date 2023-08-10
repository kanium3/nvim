return {
    {
        'vim-denops/denops.vim',
        lazy = false
    },
    {
        "vim-skk/skkeleton",
        dependencies = {
            "vim-denops/denops.vim"
        },
        config = function()
            vim.cmd([[
                call skkeleton#config({
                \ 'useSkkServer': v:false
                \ })
            ]])
        end
    }
}
