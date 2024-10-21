local M = {}
local config = require("cursor_clone.config")
local utils = require("cursor_clone.utils")

-- Add a local variable for the API key
local api_key = config.options.openai_api_key

function M.generate_response(prompt)
    -- Implement OpenAI API call here
    -- This is a placeholder and needs to be implemented with actual API calls
    return "OpenAI response placeholder"
end

return M
