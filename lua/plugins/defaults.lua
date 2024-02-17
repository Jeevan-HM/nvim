return {
    {
        "nvimdev/dashboard-nvim",

        opts = function(_, opts)
            local logo = [[



                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 


       ]]
            opts.config.header = vim.split(logo, "\n")
        end,
    },
    {
        "noice.nvim",
        opts = function(_, opts)
            opts.cmdline = {
                view = "cmdline",
            }
        end,
    },
    {
        "rcarriga/nvim-notify",
        enabled = false,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = function(_, opts)
            opts.filesystem = {
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    follow_current_file = { enabled = true },
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        -- '.git',
                        -- '.DS_Store',
                        -- 'thumbs.db',
                    },
                    never_show = {},
                },
            }
            opts.window = {
                width = 30,
            }
            opts.git_status = {
                symbols = {
                    -- Change type
                    added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = "✖", -- this can only be used in the git_status source
                    renamed = "󰁕", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "󰄱",
                    staged = "",
                    conflict = "",
                },
            }
            opts.name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- disable the keymap to grep files
            { "<leader>/", false },
            -- change a keymap
            {
                "<C-p>",
                function()
                    require("telescope.builtin").git_files({})
                end,
                desc = "Find Git files",
            },
            {
                "<leader>ps",
                function()
                    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Grep String",
            },
            {
                "<leader>lg",
                function()
                    require("telescope.builtin").live_grep()
                end,
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = {
                lua = { "stylua" },
                fish = { "fish_indent" },
                sh = { "shfmt" },
                python = { "ruff", "black" },
            }
        end,
    },
}
