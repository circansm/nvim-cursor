local M = {}
local config = require("cursor_clone.config")
local utils = require("cursor_clone.utils")

-- Function to set up the plugin
function M.setup(opts)
    config.setup(opts)
    
    -- Set up keybindings
    local keymap_opts = { noremap = true, silent = true }
    for cmd, key in pairs(config.options.keybindings) do
        vim.api.nvim_set_keymap('n', key, string.format(":lua require('cursor_clone').%s()<CR>", cmd), keymap_opts)
    end

    -- Load the appropriate AI provider module
    if config.options.ai_provider == "openai" then
        M.ai_provider = require("cursor_clone.providers.openai")
    elseif config.options.ai_provider == "anthropic" then
        M.ai_provider = require("cursor_clone.providers.anthropic")
    else
        vim.notify("CursorClone: Invalid AI provider specified. Using OpenAI as default.", vim.log.levels.WARN)
        M.ai_provider = require("cursor_clone.providers.openai")
    end
end

-- Function to start the AI assistant
function M.start_ai_assistant()
    if not utils.check_api_key() then return end
    local chat_buf = utils.create_chat_window()
    -- TODO: Implement AI chat logic
    vim.api.nvim_buf_set_lines(chat_buf, 0, -1, false, {"AI Assistant started. Type your message here."})
end

-- Function to explain code
function M.explain_code()
    if not utils.check_api_key() then return end
    local content = utils.get_selected_text()
    -- TODO: Implement code explanation logic using content
    utils.show_floating_window("Code explanation placeholder for:\n" .. content)
end

-- Function to generate code
function M.generate_code()
    if not config.options.api_key then
        vim.notify("CursorClone: API key not set. Cannot generate code.", vim.log.levels.ERROR)
        return
    end
    -- TODO: Implement code generation logic
    utils.show_floating_window("Code generation placeholder")
end

-- Function to understand codebase
function M.understand_codebase()
    if not config.options.api_key then
        vim.notify("CursorClone: API key not set. Cannot understand codebase.", vim.log.levels.ERROR)
        return
    end
    local files = utils.get_project_files()
    -- TODO: Implement codebase understanding logic
    utils.show_floating_window("Codebase understanding placeholder. Found " .. #files .. " files.")
end

-- Function to create new AI project
function M.create_new_project()
    if not config.options.api_key then
        vim.notify("CursorClone: API key not set. Cannot create new project.", vim.log.levels.ERROR)
        return
    end
    -- TODO: Implement new project creation logic
    utils.show_floating_window("New project creation placeholder")
end

-- Function to auto debug and fix lint issues
function M.auto_debug_and_lint()
    if not config.options.api_key then
        vim.notify("CursorClone: API key not set. Cannot auto debug and lint.", vim.log.levels.ERROR)
        return
    end
    if not config.options.enable_auto_debug and not config.options.enable_auto_lint then
        vim.notify("CursorClone: Auto debug and lint features are disabled.", vim.log.levels.WARN)
        return
    end
    -- TODO: Implement auto debug and lint logic
    utils.show_floating_window("Auto debug and lint placeholder")
end

-- Function for tab completion
function M.tab_completion()
    if not config.options.api_key or not config.options.tab_completion then
        return
    end
    -- TODO: Implement tab completion logic
end

-- Function for natural language editing
function M.natural_language_edit()
    if not config.options.api_key or not config.options.natural_language_editing then
        vim.notify("CursorClone: Natural language editing is disabled.", vim.log.levels.WARN)
        return
    end
    -- TODO: Implement natural language editing logic
    utils.show_floating_window("Natural language editing placeholder")
end

return M
