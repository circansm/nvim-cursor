# Cursor Clone

Cursor Clone is a Neovim plugin that provides AI-powered coding assistance, including code explanation, generation, and more.

## Features

- AI-powered code assistant
- Code explanation
- Code generation
- Codebase understanding
- New project creation
- Auto debug and lint
- Natural language editing

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following to your Neovim configuration:

```lua
{
  "yourusername/cursor_clone",
  config = function()
    require("cursor_clone").setup({
      openai_api_key = "your_openai_api_key_here",  -- If using OpenAI
      anthropic_api_key = "your_anthropic_api_key_here",  -- If using Anthropic
      -- Add any other configuration options here
    })
  end,
}
```

### Manual Installation

1. Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/yourusername/cursor_clone.git ~/.config/nvim/pack/plugins/start/cursor_clone
```

2. Add the following to your Neovim configuration file (usually `~/.config/nvim/init.lua`):

```lua
require('cursor_clone').setup({
    api_key = "your_openai_api_key_here",
    -- Add any other configuration options here
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

## License

[MIT License](LICENSE)
