return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED for harpoon2 (sets up autocmds, etc.)
    harpoon:setup({})

    -- Add current file to the default list
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Add file" })

    -- Toggle Harpoon quick menu
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toggle quick menu" })

    -- Jump to marked files by index
    vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
    vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
    vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
    vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })

    -- Cycle previous/next in the Harpoon list
    vim.keymap.set("n", "<C-A-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
    vim.keymap.set("n", "<C-A-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })

    -- Telescope UI for Harpoon list
    local conf = require("telescope.config").values
    local function toggle_telescope(hlist)
      local file_paths = {}
      for _, item in ipairs(hlist.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<leader>h", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Harpoon: Open Telescope window" })
  end,
}

