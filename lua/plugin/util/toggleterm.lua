return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = {
        "ToggleTerm",
    },
    opts = {
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return string.format("#%d", term.id)
            end
        },
    },
}
