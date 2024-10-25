vim.api.nvim_create_autocmd("ColorScheme",{
  pattern="*",
  callback = function()
	vim.defer_fn(function()
		local color = vim.g.colors_name -- color
		if color  == "gruvbox" then
			vim.o.background = "light"
			elseif color == "retrobox" then
			vim.o.background = "dark"
		end
	  end, 0)
	end
})
