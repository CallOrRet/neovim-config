return {
    "nvimdev/dashboard-nvim",
    event = "User ShowDashboard",
    cmd = { "Dashboard" },
    config = function()
        local logo = {
            "",
            "",
            "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
            "",
        }
        require("dashboard").setup({
            theme = "doom",
            hide = {
                -- let other plugins control statusline and tabline
                statusline = false,
                tabline = false,
                winbar = false,
            },
            config = {
                header = logo,
                center = {
                    { action = "Telescope projects", desc = " Projects", icon = " ", key = "p" },
                    { action = "Telescope find_files", desc = " Find file", icon = "󰮗 ", key = "f" },
                    { action = "enew", desc = " New file", icon = " ", key = "n" },
                    { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
                    { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
                    { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                    { action = "Mason", desc = " Mason", icon = " ", key = "m" },
                    { action = "qa", desc = " Quit", icon = " ", key = "q" },
                    { action = "edit ~/.local/share/nvim/project_nvim/project_history", desc = " Edit projects", icon = " ", key = "e" },
                },
            }
        })
    end
}
