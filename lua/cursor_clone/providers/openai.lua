local M = {}
local config = require("cursor_clone.config")
local utils = require("cursor_clone.utils")
local curl = require("plenary.curl")
local json = vim.json

-- Add a local variable for the API key
local api_key = config.options.openai_api_key

function M.generate_response(prompt)
    local url = "https://api.openai.com/v1/chat/completions"
    local headers = {
        ["Authorization"] = "Bearer " .. api_key,
        ["Content-Type"] = "application/json"
    }
    local data = {
        model = config.options.ai_model,
        messages = {{role = "user", content = prompt}},
        max_tokens = config.options.max_tokens,
        temperature = config.options.temperature
    }

    local response = curl.post(url, {
        headers = headers,
        body = json.encode(data)
    })

    if response.status ~= 200 then
        error("OpenAI API request failed: " .. response.body)
    end

    local result = json.decode(response.body)
    return result.choices[1].message.content
end

return M
