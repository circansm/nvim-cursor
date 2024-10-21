local M = {}

M.defaults = {
    -- Default configuration options
    ai_model = "gpt-3.5-turbo",
    max_tokens = 1000,
    api_key = nil,  -- User should provide their own API key
}

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
    if not M.options.api_key then
        vim.notify("CursorClone: API key not set. Please set it in your configuration.", vim.log.levels.WARN)
    end
    if type(M.options.max_tokens) ~= "number" or M.options.max_tokens <= 0 then
        vim.notify("CursorClone: Invalid max_tokens value. Using default.", vim.log.levels.WARN)
        M.options.max_tokens = M.defaults.max_tokens
    end
end

return M
