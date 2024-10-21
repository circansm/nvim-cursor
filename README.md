# Nvim-Cursor

Nvim-Cursor is a Neovim plugin that provides AI-powered coding assistance, including code explanation, generation, and more.

## Features

- AI-powered code assistant
- Code explanation
- Code generation
- Codebase understanding
- New project creation
- Auto debug and lint
- Natural language editing

## Installation

### Dependencies

This plugin requires [Plenary.nvim](https://github.com/nvim-lua/plenary.nvim). Make sure it's installed before proceeding.

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following to your Neovim configuration (usually in `~/.config/nvim/init.lua`):

```lua
{
  "circansm/nvim-cursor",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("cursor_clone").setup({
      ai_provider = "openai",  -- or "anthropic"
      openai_api_key = "your_openai_api_key_here",  -- If using OpenAI
      anthropic_api_key = "your_anthropic_api_key_here",  -- If using Anthropic
      -- Add any other configuration options here
    })
  end,
}
```

Note: The plugin is named "nvim-cursor" in the repository, but the Lua module is named "cursor_clone".

### Manual Installation

If you're not using a plugin manager, you can manually install the plugin:

1. Clone the repository:
   ```
   git clone https://github.com/circansm/nvim-cursor.git ~/.local/share/nvim/site/pack/plugins/start/nvim-cursor
   ```

2. Ensure that Plenary.nvim is also installed.

3. Add the following to your Neovim configuration:
   ```lua
   require("cursor_clone").setup({
     -- Your configuration options here
   })
   ```

## Configuration

Here are the available configuration options:

```lua
{
    ai_provider = "openai",  -- AI provider to use ("openai" or "anthropic")
    ai_model = "gpt-3.5-turbo",  -- AI model to use (e.g., "gpt-3.5-turbo" for OpenAI, "claude-2" for Anthropic)
    temperature = 0.7,  -- AI response temperature
    max_tokens = 1000,  -- Maximum tokens for AI response
    openai_api_key = nil,  -- Your OpenAI API key (required if using OpenAI)
    anthropic_api_key = nil,  -- Your Anthropic API key (required if using Anthropic)
    chat_window_type = "split",  -- "split" or "floating"
    symbol_reference_depth = "file",  -- "file" or "project"
    enable_auto_debug = false,  -- Enable auto debugging
    enable_auto_lint = false,  -- Enable auto linting
    tab_completion = true,  -- Enable AI-powered tab completion
    natural_language_editing = true,  -- Enable natural language editing
}
```

## Keybindings

The default keybindings are:

- `<leader>ca`: Start AI assistant
- `<leader>ce`: Explain selected code
- `<leader>cg`: Generate code
- `<leader>cu`: Understand codebase
- `<leader>cn`: Create new AI project
- `<leader>cd`: Auto debug and lint
- `<leader>cl`: Natural language editing

To modify these keybindings, you can add your own keymaps in your Neovim configuration:

```lua
vim.api.nvim_set_keymap('n', '<your-key>', ':CursorCloneAI<CR>', { noremap = true, silent = true })
```

Replace `<your-key>` with your preferred key combination and `CursorCloneAI` with the desired command.

## Troubleshooting

If you encounter any issues with the plugin not loading correctly, ensure that:

1. The plugin is installed in the correct directory (`~/.local/share/nvim/site/pack/plugins/start/nvim-cursor` for manual installation).
2. You're using `require("cursor_clone")` in your configuration, not `require("nvim-cursor")`.
3. All dependencies, especially Plenary.nvim, are installed and loaded correctly.

## License

[MIT License](LICENSE)
