return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true }, -- Enable follow current file
      },
      window = {
        mappings = {
          ['Y'] = function(state)
            -- Get the selected node
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            -- Prepare file path options
            local results = {
              filepath,
              modify(filepath, ':.'),
              modify(filepath, ':~'),
              filename,
              modify(filename, ':r'),
              modify(filename, ':e'),
            }

            -- Display a menu for the user to choose what to copy
            vim.ui.select({
              '1. Absolute path: ' .. results[1],
              '2. Path relative to CWD: ' .. results[2],
              '3. Path relative to HOME: ' .. results[3],
              '4. Filename: ' .. results[4],
              '5. Filename without extension: ' .. results[5],
              '6. Extension of the filename: ' .. results[6],
            }, { prompt = 'Choose to copy to clipboard:' }, function(choice)
              local i = tonumber(choice:sub(1, 1))  -- Get the selected choice
              local result = results[i]  -- Get the result based on selection

              -- Copy the selected result to the system clipboard using "*"
              vim.fn.setreg('*', result)
              vim.notify('Copied to clipboard: ' .. result)
            end)
          end
        }
      }
    })

    -- Toggle Neo-tree with Ctrl + n
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")

    -- Close Neo-tree with Ctrl + b
    vim.keymap.set("n", "<C-b>", ":Neotree close<CR>")

    -- Show current file in Neo-tree with leader + c
    vim.keymap.set("n", "<leader>c", ":Neotree reveal<CR>", { noremap = true, silent = true })
  end,
}
