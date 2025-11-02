return {
	'mbbill/undotree',
	config = function()
		vim.g.undotree_WindowLayout = 4
	vim.g.undotree_Diffpanel = 1
	vim.g.undotree_DiffpanelHeight = 15
	vim.g.undotree_ShortIndicators = 1
	vim.g.undotree_SplitWidth = 40
	vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)

	end,
}
