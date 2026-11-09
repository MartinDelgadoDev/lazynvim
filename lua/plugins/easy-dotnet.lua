return {
    "GustavEikaas/easy-dotnet.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        require("easy-dotnet").setup({
            picker = "telescope",

            lsp = {
                enabled = true,
            },

            diagnostics = {
                default_severity = "error",
                setqflist = false,
            },
        })
    end,
}
