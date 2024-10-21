local M = {}

-- Function to get the current buffer content
function M.get_buffer_content()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    return table.concat(lines, "\n")
end

-- Function to display results in a floating window
function M.show_floating_window(content)
    -- TODO: Implement floating window logic
end

return M
