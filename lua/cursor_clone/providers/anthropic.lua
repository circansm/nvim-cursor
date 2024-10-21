local M = {}
local config = require("cursor_clone.config")
local utils = require("cursor_clone.utils")

-- Add a local variable for the API key
local api_key = config.options.anthropic_api_key

function M.generate_response(prompt)
    -- Implement Anthropic API call here
    -- This is a placeholder and needs to be implemented with actual API calls
    return "Anthropic response placeholder"
end

return M
