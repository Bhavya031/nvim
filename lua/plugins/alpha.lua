return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                           ]],
      [[ ██████╗ ██╗  ██╗ █████╗ ██╗   ██╗██╗   ██╗ █████╗        ]],
      [[ ██╔══██╗██║  ██║██╔══██╗██║   ██║╚██╗ ██╔╝██╔══██╗       ]],
      [[ ██████╔╝███████║███████║██║   ██║ ╚████╔╝ ███████║       ]],
      [[ ██╔══██╗██╔══██║██╔══██║╚██╗ ██╔╝  ╚██╔╝  ██╔══██║       ]],
      [[ ██████╔╝██║  ██║██║  ██║ ╚████╔╝    ██║   ██║  ██║       ]],
      [[ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝     ╚═╝   ╚═╝  ╚═╝       ]],
      [[                                                           ]],
      [[                                                           ]],
      [[                                                           ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    local function footer()
      local datetime = os.date("%d-%m-%Y %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return string.format("Neovim %s  %s", nvim_version_info, datetime)
    end

    dashboard.section.footer.val = footer()

    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
