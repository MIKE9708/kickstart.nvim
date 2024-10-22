vim.api.nvim_create_autocmd("ColorScheme",{
  pattern="*",
  callback = function()
	local color = vim.g.colors_name -- color
	if color  == "gruvbox" then
      	vim.cmd[[colorscheme color]]
		vim.cmd[[set background=light]]
		-- vim.o.background = "light" 
	else
		-- vim.o.background = "dark" 
      	vim.cmd[[colorscheme color]]
		vim.cmd[[set background=dark]]
	end
  end,
})
