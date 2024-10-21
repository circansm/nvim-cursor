local M = {}
local config = require("cursor_clone.config")

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

-- Function to create a split window for chat
function M.create_chat_window()
    if config.options.chat_window_type == "split" then
        vim.cmd("vsplit")
        vim.cmd("enew")
        return vim.api.nvim_get_current_buf()
    else
        return M.show_floating_window("")
    end
end

-- Function to get selected text
function M.get_selected_text()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
    if #lines == 1 then
        lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
    else
        lines[1] = string.sub(lines[1], start_pos[3])
        lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    end
    return table.concat(lines, "\n")
end

-- Function to get all files in the project
function M.get_project_files()
    local handle = io.popen("git ls-files")
    local result = handle:read("*a")
    handle:close()
    return vim.split(result, "\n")
end

-- Function to read file content
function M.read_file(file_path)
    local file = io.open(file_path, "r")
    if not file then return nil end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to check if API key is set
function M.check_api_key()
    if config.options.ai_provider == "openai" and not config.options.openai_api_key then
        vim.notify("CursorClone: OpenAI API key not set. Please set it in your configuration.", vim.log.levels.ERROR)
        return false
    elseif config.options.ai_provider == "anthropic" and not config.options.anthropic_api_key then
        vim.notify("CursorClone: Anthropic API key not set. Please set it in your configuration.", vim.log.levels.ERROR)
        return false
    end
    return true
end

-- Function to get the appropriate API key
function M.get_api_key()
    if config.options.ai_provider == "openai" then
        return config.options.openai_api_key
    elseif config.options.ai_provider == "anthropic" then
        return config.options.anthropic_api_key
    end
    return nil
end

return M
