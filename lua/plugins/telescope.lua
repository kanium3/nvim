return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "jvgrootveld/telescope-zoxide",
    },
    cmd = { "Telescope" },
    config = function()
        local telescope = require("telescope")
        local z_utils = require("telescope._extensions.zoxide.utils")
        telescope.setup({
            extensions = {
                package_info = {
                    theme = "ivy",
                },
                -- from https://github.com/jvgrootveld/telescope-zoxide
                zoxide = {
                    prompt_title = "zoxide",
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end,
                        },
                        ["<C-s>"] = {
                            before_action = function(_)
                                print("before C-s")
                            end,
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end,
                        },
                        -- Opens the selected entry in a new split
                        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("zoxide")

        vim.keymap.set("n", "<leader>lg", "<Cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
    end,
}
