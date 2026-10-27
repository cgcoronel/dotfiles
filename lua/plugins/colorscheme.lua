return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            auto_integrations = true,
        })

        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
