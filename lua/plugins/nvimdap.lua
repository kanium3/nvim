return {
    {
        "mfussenegger/nvim-dap",
        module = true,
        ft = { "rust", "c", "cpp" },
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
