-- WARNING: plugins that depend on denops.vim should not be lazy loaded with lazy.nvim configuration
return {
    {
        'vim-denops/denops.vim',
        event = "VeryLazy"
    },
    {
        "vim-skk/skkeleton",
        dependencies = {
            "vim-denops/denops.vim"
        },
        keys = {
            { "<C-j>", "<Plug>(skkeleton-toggle)", mode = { "i", "c", "l" } },
        },
        config = function()
            -- Lazy loaded by using this function
            vim.fn["denops#plugin#register"]("skkeleton")

            if not jit.os == 'Windows' then
                vim.fn["skkeleton#config"] {
                    useSkkServer = true
                }
            else
                local windows_home = vim.fn.expand("~") -- ex:C://home/annko
                vim.fn["skkeleton#config"] {
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
                    }
                }
            end
        end
    },
    {
        "lambdalisue/kensaku.vim",
        dependencies = {
            "vim-denops/denops.vim"
        },
        lazy = true,
        config = function()
            vim.fn["denops#plugin#register"]("kensaku")
        end
    },
    {
        "yuki-yano/fuzzy-motion.vim",
        dependencies = {
            "vim-denops/denops.vim",
            "lambdalisue/kensaku.vim"
        },
        keys = {
            { "<leader>fz", "<Cmd>FuzzyMotion<CR>", desc = "fuzzy finder" }
        },
        init = function ()
            vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }
        end,
        config = function()
            vim.fn["denops#plugin#register"]("fuzzy-motion")
        end
    },
}
