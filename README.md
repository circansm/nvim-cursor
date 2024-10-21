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

## Usage

For information on how to use Nvim-Cursor, please see the [Usage Guide](docs/USAGE.md).

## Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
