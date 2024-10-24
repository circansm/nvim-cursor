if vim.g.loaded_cursor_clone == 1 then
    return
end
vim.g.loaded_cursor_clone = 1

local cursor_clone = require("cursor_clone")

-- Define user commands
vim.api.nvim_create_user_command("CursorCloneAI", function()
    cursor_clone.start_ai_assistant()
end, {desc = "Start AI assistant"})

vim.api.nvim_create_user_command("CursorCloneExplain", function()
    cursor_clone.explain_code()
end, {desc = "Explain selected code"})

vim.api.nvim_create_user_command("CursorCloneGenerate", function()
    cursor_clone.generate_code()
end, {desc = "Generate code"})

vim.api.nvim_create_user_command("CursorCloneUnderstand", function()
    cursor_clone.understand_codebase()
end, {desc = "Understand current codebase"})

vim.api.nvim_create_user_command("CursorCloneNewProject", function()
    cursor_clone.create_new_project()
end, {desc = "Create a new project"})

vim.api.nvim_create_user_command("CursorCloneDebugLint", function()
    cursor_clone.auto_debug_and_lint()
end, {desc = "Auto debug and lint"})

vim.api.nvim_create_user_command("CursorCloneNaturalEdit", function()
    cursor_clone.natural_language_edit()
end, {desc = "Edit using natural language"})

-- Set up the plugin with default options
cursor_clone.setup()
