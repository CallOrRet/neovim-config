-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local exclude = { "gitcommit" }
        local buf = args.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(args)
        if args.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(args.match) or args.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

vim.api.nvim_create_augroup("_dir_opened", {})
vim.api.nvim_create_autocmd("BufEnter", {
    group = "_dir_opened",
    nested = true,
    callback = function(args)
        vim.api.nvim_del_augroup_by_name("_dir_opened")
        if args.match ~= "" then
            local stat = vim.loop.fs_stat(args.match)
            if stat and stat.type == "directory" then
                vim.schedule(function()
                    vim.api.nvim_exec_autocmds("User", { pattern = "DirOpenedLazy" })
                    vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
                end)
                vim.api.nvim_exec_autocmds("User", { pattern = "DirOpened" })
                vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
            end
        else
            vim.api.nvim_exec_autocmds("User", { pattern = "ShowDashboard" })
        end
    end,
})

vim.api.nvim_create_augroup("_file_opened", {})
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePost" }, {
    group = "_file_opened",
    nested = true,
    callback = function(args)
        if vim.bo[args.buf].buftype == "nofile" then return end
        if args.event == "BufNewFile" then
            vim.api.nvim_del_augroup_by_name("_file_opened")
            vim.schedule(function()
                vim.api.nvim_exec_autocmds("User", { pattern = "FileOpenedLazy" })
                vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
            end)
            vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
            vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
            return
        end
        if args.macth ~= "" then
            local stat = vim.loop.fs_stat(args.match)
            if stat and stat.type == "file" then
                vim.api.nvim_del_augroup_by_name("_file_opened")
                vim.schedule(function()
                    vim.api.nvim_exec_autocmds("User", { pattern = "FileOpenedLazy" })
                    vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
                end)
                vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
                vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
            end
        end
    end,
})
