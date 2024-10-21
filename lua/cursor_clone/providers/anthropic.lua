local M = {}
local config = require("cursor_clone.config")
local utils = require("cursor_clone.utils")
local curl = require("plenary.curl")
local json = vim.json

-- Add a local variable for the API key
local api_key = config.options.anthropic_api_key

function M.generate_response(prompt)
    local url = "https://api.anthropic.com/v1/messages"
    local headers = {
        ["x-api-key"] = api_key,
        ["anthropic-version"] = "2023-06-01",
        ["content-type"] = "application/json"
    }
    local data = {
        model = config.options.ai_model,
        max_tokens = config.options.max_tokens,
        messages = {
            {role = "user", content = prompt}
        }
    }

    local response = curl.post(url, {
        headers = headers,
        body = json.encode(data)
    })

    if response.status ~= 200 then
        error("Anthropic API request failed: " .. response.body)
    end

    local result = json.decode(response.body)
    return result.content[1].text
end

return M
