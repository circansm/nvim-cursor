if vim.g.loaded_cursor_clone == 1 then
    return
end
vim.g.loaded_cursor_clone = 1

local cursor_clone = require("cursor_clone")

-- Define user commands
vim.api.nvim_create_user_command("CursorCloneAI", function()
    cursor_clone.start_ai_assistant()
end, {})

vim.api.nvim_create_user_command("CursorCloneExplain", function()
    cursor_clone.explain_code()
end, {})

vim.api.nvim_create_user_command("CursorCloneGenerate", function()
    cursor_clone.generate_code()
end, {})

-- Set up the plugin with default options
cursor_clone.setup()
