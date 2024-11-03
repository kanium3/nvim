return {
    "rest-nvim/rest.nvim",
    --cmd = { "Rest" },
    event = { "VeryLazy" },
    init = function ()
        ---@type Rest.Opts
        vim.g.rest_nvim = {
        }
    end
}
