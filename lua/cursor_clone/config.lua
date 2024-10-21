local M = {}

M.defaults = {
    -- Default configuration options
    ai_provider = "openai",  -- or "anthropic"
    ai_model = "gpt-3.5-turbo",  -- or "claude-2" for Anthropic
    temperature = 0.7,
    max_tokens = 1000,
    openai_api_key = nil,  -- User should provide their own OpenAI API key
    anthropic_api_key = nil,  -- User should provide their own Anthropic API key
    chat_window_type = "split",  -- or "floating"
    symbol_reference_depth = "file",  -- or "project"
    enable_auto_debug = false,
    enable_auto_lint = false,
    tab_completion = true,
    natural_language_editing = true,
    -- Keybindings
    keybindings = {
        start_ai_assistant = "<leader>ca",
        explain_code = "<leader>ce",
        generate_code = "<leader>cg",
        understand_codebase = "<leader>cu",
        create_new_project = "<leader>cn",
        auto_debug_and_lint = "<leader>cd",
        natural_language_edit = "<leader>cl",
    },
}

-- Setup function to initialize the plugin with user-provided options
function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
    if M.options.ai_provider == "openai" and not M.options.openai_api_key then
        vim.notify("CursorClone: OpenAI API key not set. Please set it in your configuration.", vim.log.levels.WARN)
    elseif M.options.ai_provider == "anthropic" and not M.options.anthropic_api_key then
        vim.notify("CursorClone: Anthropic API key not set. Please set it in your configuration.", vim.log.levels.WARN)
    end
    if type(M.options.max_tokens) ~= "number" or M.options.max_tokens <= 0 then
        vim.notify("CursorClone: Invalid max_tokens value. Using default.", vim.log.levels.WARN)
        M.options.max_tokens = M.defaults.max_tokens
    end
end

return M
