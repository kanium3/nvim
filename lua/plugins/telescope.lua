return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    cmd = { "Telescope" },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                package_info = {
                    theme = "ivy",
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
