return {
    {
        "mfussenegger/nvim-dap",
        module = true,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        ft = { "rust", "c", "cpp" },
        opts = {}
    }
}
