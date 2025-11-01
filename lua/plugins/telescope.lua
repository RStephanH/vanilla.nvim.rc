-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    name = "telescope",
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
	      defaults = {
		      layout_strategy = "horizontal",
	      },
      },
      config = function(_, opts)
	      require("telescope").setup(opts)

	      local builtin = require("telescope.builtin")
	      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
	      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
	      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
	      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
	      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Help tags" })
	      vim.keymap.set("n", "<leader>ps", function()
		      builtin.grep_string({ search = vim.fn.input("Grep > ")});
	      end)
      end,
    }
