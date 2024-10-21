local M = {}

-- Function to get the current buffer content
function M.get_buffer_content()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    return table.concat(lines, "\n")
end

-- Function to display results in a floating window
function M.show_floating_window(content)
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
    
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }
    
    vim.api.nvim_open_win(buf, true, opts)
end

return M
