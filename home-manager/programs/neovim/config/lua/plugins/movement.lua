return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon"):list():append()
                end,
                desc = "harpoon file",
            },
            {
                "<leader>h",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "harpoon quick menu",
            },
            {
                "<C-h>",
                function()
                    require("harpoon"):list():select(1)
                end,
                desc = "harpoon to file 1",
            },
            {
                "<C-j>",
                function()
                    require("harpoon"):list():select(2)
                end,
                desc = "harpoon to file 2",
            },
            {
                "<C-k>",
                function()
                    require("harpoon"):list():select(3)
                end,
                desc = "harpoon to file 3",
            },
            {
                "<C-l>",
                function()
                    require("harpoon"):list():select(4)
                end,
                desc = "harpoon to file 4",
            },
            {
                "<M-h>",
                function()
                    require("harpoon"):list():select(5)
                end,
                desc = "harpoon to file 5",
            },
            {
                "<M-j>",
                function()
                    require("harpoon"):list():select(6)
                end,
                desc = "harpoon to file 6",
            },
            {
                "<M-k>",
                function()
                    require("harpoon"):list():select(7)
                end,
                desc = "harpoon to file 7",
            },
            {
                "<M-l>",
                function()
                    require("harpoon"):list():select(8)
                end,
                desc = "harpoon to file 8",
            },
        },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
    },
}
