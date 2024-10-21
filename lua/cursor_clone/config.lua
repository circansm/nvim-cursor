local M = {}

M.defaults = {
    -- Default configuration options
    ai_model = "gpt-3.5-turbo",
    max_tokens = 1000,
    -- Add more default options as needed
}

function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
