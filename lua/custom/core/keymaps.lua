local function map(mode, lhs, rhs, opts)
	-- no remap non recursive
	-- silent no echo
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Personal shortcut
-- No arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Mapping in insert mode navigation
map('i', '<C-k>', '<up>')
map('i', '<C-j>', '<down>')
map('i', '<C-h>', '<left>')
map('i', '<C-l>', '<right>')

-- NeoTree
map('n', '<C-n>', ':Neotree toggle<CR>')

-- Remap for keep moving text in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Remap paste in insert mode
map('i', '<C-p>', '<C-r>+')
vim.keymap.set('i', '<C-p>', '<C-r>+', {})
-- Window resize
map("n", "=", [[<cmd>vertical resize +5<cr>]])
map('n', '-', [[<cmd>vertical resize -5<cr>]])
map('n', '+', [[<cmd>horizontal resize +2<cr>]])
map('n', '_', [[<cmd>horizontal resize -2<cr>]])

-- Change Window
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

-- Toggle Mason using M
map("n", 'M', ':Mason <CR>')

-- Enable autoformat on Save
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end
	end
})
