return {
    {
        "nvim-lualine/lualine.nvim",
        -- optional = true,
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
            -- require("lualine").setup({
            --     theme = "dracula",
            -- })
            opts.theme = "dracula"
        end,
    },
}
