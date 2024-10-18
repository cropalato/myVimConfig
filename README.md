# Neovim Configuration

This repository contains my personal Neovim configuration files. It is designed for performance, extensibility, and ease of customization using Lua.

## Overview

- **init.lua**: The main entry point for setting up Neovim configuration and loading additional Lua modules.
- **lazy-lock.json**: Tracks the specific versions of the plugins installed through the Lazy plugin manager.
- **lua/**: Contains all Lua-based configuration files for Neovim.

### Lua Configuration Files

- **config/**
  - `lazy.lua`: Configuration for the Lazy plugin manager, used to handle plugin loading and lazy loading.
  - `maps.lua`: Custom key mappings for enhancing productivity.
  - `settings.lua`: General Neovim settings such as UI, performance tweaks, and editor behavior.
  - `plugins/`: Contains individual plugin configurations.
  - `functions.lua`: Helper functions used throughout the configuration.

## How to Use

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
   ```

2. Install [Neovim](https://neovim.io/) if you haven't already.

3. Open Neovim, and the plugins should install automatically.

4. Customize the configuration by editing the files inside `lua/config`.

## Plugin Manager

This configuration uses the Lazy plugin manager for efficient plugin loading. All plugins are managed through the `lazy.lua` file.

## Key Bindings

Key bindings are customized in the `maps.lua` file. You can modify or extend the key mappings according to your preferences.

## Settings

All general editor settings, such as appearance, tab behavior, and performance optimizations, can be found in `settings.lua`.

## Contributing

Feel free to open issues or submit pull requests to improve or expand the configuration.
