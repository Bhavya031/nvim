-- ~/.config/nvim/lua/plugins.lua (or wherever you manage your plugins)

return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while commenting
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    line = 'gcc',   -- Line-comment toggle keymap
                    block = 'gbc',  -- Block-comment toggle keymap
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    line = 'gc',    -- Line-comment keymap
                    block = 'gb',   -- Block-comment keymap
                },
                ---Extra mappings
                extra = {
                    above = 'gcO',  -- Add comment on the line above
                    below = 'gco',  -- Add comment on the line below
                    eol = 'gcA',    -- Add comment at the end of line
                },
                ---Enable keybindings
                mappings = {
                    basic = true,   -- Enable basic operator-pending mappings
                    extra = true,   -- Enable extra mappings
                },
                ---Hooks for customization (optional)
                pre_hook = nil,    -- Function to call before (un)comment
                post_hook = nil,   -- Function to call after (un)comment
            })
        end
    },
}
