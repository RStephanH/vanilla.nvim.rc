
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
	  ensure_installed = {
		  "typescript",
		  "javascript",
		  "java",
		  "go",
		  "lua",
		  "python",
		  "bash"
	  },

	  sync_install = false,
	  auto_install = true,

	  highlight = {
		  enable = true,
		  additional_vim_regex_highlighting = false,
	  },

  },
}

