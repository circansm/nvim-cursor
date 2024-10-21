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
  build = ":TSUpdate",
  commit = "main",
}
```

Note: The repository is named "nvim-cursor", but the Lua module is named "cursor_clone".

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

For detailed configuration options, please refer to the [Configuration](docs/CONFIGURATION.md) documentation.

### Default Keybindings

Nvim-Cursor comes with the following default keybindings:

- `<leader>ca`: Start AI assistant
- `<leader>ce`: Explain selected code
- `<leader>cg`: Generate code
- `<leader>cu`: Understand current codebase
- `<leader>cn`: Create a new project
- `<leader>cd`: Auto debug and lint
- `<leader>cl`: Edit using natural language

### Modifying Default Keybindings

You can modify the default keybindings in your Neovim configuration file. Here's an example of how to change the keybinding for starting the AI assistant:

```lua
require("cursor_clone").setup({
  keybindings = {
    start_ai_assistant = "<leader>ai",  -- Changed from <leader>ca to <leader>ai
    -- Other keybindings remain unchanged
  }
})
```

### Adding Custom Keybindings

To add custom keybindings, you can use Neovim's `vim.keymap.set` function in your `init.lua` file. Here's an example:

```lua
vim.keymap.set('n', '<leader>cc', require('cursor_clone').start_ai_assistant, { desc = "Start CursorClone AI Assistant" })
```

This adds a new keybinding `<leader>cc` in normal mode to start the AI assistant.

## Usage

For information on how to use Nvim-Cursor, please see the [Usage Guide](docs/USAGE.md).

## Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
