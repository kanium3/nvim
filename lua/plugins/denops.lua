-- WARNING: plugins that depend on denops.vim should not be lazy loaded with lazy.nvim configuration
return {
    {
        "vim-denops/denops.vim",
        event = "VeryLazy",
    },
    {
        "vim-skk/skkeleton",
        dependencies = {
            "vim-denops/denops.vim",
        },
        keys = {
            { "<C-j>", "<Plug>(skkeleton-toggle)", mode = { "i", "c", "l" } },
        },
        config = function()
            local plugins = require("config.plugin").get_plugin_name_path()
            local this_path = plugins["skkeleton"] .. "/denops/skkeleton/main.ts"
            -- Lazy loaded by using this function
            vim.fn["denops#plugin#load"]("skkeleton", this_path)

            if jit.os == "Linux" then
                vim.fn["skkeleton#config"]({
                    sources = { "skk_server" },
                })
            elseif jit.os == "Windows" then
                local windows_home = vim.fn.expand("~") -- ex:C://home/annko
                vim.fn["skkeleton#config"]({
                    globalDictionaries = {
                        windows_home .. "/skk/SKK-JISYO.L/SKK-JISYO.L",
                        windows_home .. "/skk/SKK-JISYO.geo/SKK-JISYO.geo",
                        windows_home .. "/skk/SKK-JISYO.jinmei/SKK-JISYO.jinmei",
                        windows_home .. "/skk/SKK-JISYO.assoc/SKK-JISYO.assoc",
                        windows_home .. "/skk/SKK-JISYO.station/SKK-JISYO.station",
                        windows_home .. "/skk/SKK-JISYO.fullname/SKK-JISYO.fullname",
                        windows_home .. "/skk/SKK-JISYO.propernoun/SKK-JISYO.propernoun",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th-term.lisp",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th-music.lisp",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th-product.lisp",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th-character.lisp",
                        windows_home .. "/skk/SKK-JISYO.th.lisp-r12/SKK-JISYO.th.lisp-r12/SKK-JISYO.th-spellcard.lisp",
                    },
                })
            end
        end,
    },
    {
        "lambdalisue/kensaku.vim",
        dependencies = {
            "vim-denops/denops.vim",
        },
        lazy = true,
        config = function()
            local plugins = require("config.plugin").get_plugin_name_path()
            local this_path = plugins["kensaku.vim"] .. "/denops/kensaku/main.ts"
            vim.fn["denops#plugin#load"]("kensaku", this_path)
        end,
    },
    {
        "yuki-yano/fuzzy-motion.vim",
        dependencies = {
            "vim-denops/denops.vim",
            "lambdalisue/kensaku.vim",
        },
        keys = {
            { "<leader>fz", "<Cmd>FuzzyMotion<CR>", desc = "fuzzy finder" },
        },
        init = function()
            vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }
        end,
        config = function()
            local plugins = require("config.plugin").get_plugin_name_path()
            local this_path = plugins["fuzzy-motion.vim"] .. "/denops/fuzzy-motion/main.ts"
            vim.fn["denops#plugin#load"]("fuzzy-motion", this_path)
        end,
    },
}
