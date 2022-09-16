local null_ls = require("null-ls")

-- $XDG_CONFIG_HOME/cspell
local cspell_config_dir = "~/.config/cspell"
-- $XDG_DATA_HOME/cspell
local cspell_data_dir = "~/.local/share/cspell"
local cspell_files = {
	config = vim.call("expand", cspell_config_dir .. "/cspell.json"),
	openfile = vim.call("expand", cspell_config_dir .. "/openfile.txt"),
	vim = vim.call("expand", cspell_data_dir .. "/vim.txt.gz"),
	user = vim.call("expand", cspell_data_dir .. "/user.txt"),
}

if vim.fn.filereadable(cspell_files.vim) ~= 1 then
	local vim_dictionary_url = "https://github.com/iamcco/coc-spell-checker/raw/master/dicts/vim/vim.txt.gz"
	io.popen("curl -fsSLo " .. cspell_files.vim .. " --create-dirs " .. vim_dictionary_url)
end

if vim.fn.filereadable(cspell_files.user) ~= 1 then
	io.popen("mkdir -p " .. cspell_data_dir)
	io.popen("touch " .. cspell_files.user)
end

local cspell_append = function(opts)
	local word = opts.args
	if not word or word == "" then
		-- 引数がなければcwordを取得
		word = vim.call("expand", "<cword>"):lower()
	end

	-- bangの有無で保存先を分岐
	local dictionary_name = opts.bang and "openfile" or "user"

	-- shellのechoコマンドで辞書ファイルに追記
	io.popen("echo " .. word .. " >> " .. cspell_files[dictionary_name])

	-- 追加した単語および辞書を表示
	print('"' .. word .. '" is appended to ' .. dictionary_name .. " dictionary.")

	-- cspellをリロードするため、現在行を更新してすぐ戻す
	if vim.api.nvim_get_option_value("modifiable", {}) then
		vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
		vim.api.nvim_command("silent! undo")
	end
end

vim.api.nvim_create_user_command("CSpellAppend", cspell_append, { nargs = "?", bang = true })

local cspell_custom_actions = {
	method = null_ls.methods.CODE_ACTION,
	filetypes = {},
	generator = {
		fn = function(_)
			-- 現在のカーソル位置
			local lnum = vim.fn.getcurpos()[2] - 1
			local col = vim.fn.getcurpos()[3]

			-- 現在行のエラーメッセージ一覧
			local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

			-- カーソル位置にcspellの警告が出ているか探索
			local word = ""
			local regex = "^Unknown word %((%w+)%)$"
			for _, v in pairs(diagnostics) do
				if v.source == "cspell" and v.col < col and col <= v.end_col and string.match(v.message, regex) then
					-- 見つかった場合、単語を抽出
					word = string.gsub(v.message, regex, "%1"):lower()
					break
				end
			end

			-- 警告が見つからなければ終了
			if word == "" then
				return
			end

			-- cspell_appendを呼び出すactionのリストを返却
			return {
				{
					title = 'Append "' .. word .. '" to user dictionary',
					action = function()
						cspell_append({ args = word })
					end,
				},
				{
					title = 'Append "' .. word .. '" to openfile dictionary',
					action = function()
						cspell_append({ args = word, bang = true })
					end,
				},
			}
		end,
	},
}

-- null_lsに登録
null_ls.register(cspell_custom_actions)
