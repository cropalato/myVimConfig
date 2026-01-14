# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using Lua, built on LazyVim with extensive customizations. The setup supports Python, Go, TypeScript, Terraform, YAML, and other languages with LSP, formatting, debugging, and AI assistance.

## Architecture

**Entry Point:** `init.lua` enables `vim.loader` for fast startup and dynamically requires all `.lua` files from `lua/config/`.

**Plugin Manager:** Lazy.nvim with LazyVim as the base. LazyVim extras are configured in `lazyvim.json`, custom plugins in `lua/config/plugins/`.

**Configuration Structure:**
- `lua/config/lazy.lua` - Plugin manager bootstrap and spec (leader: Space, localleader: \)
- `lua/config/settings.lua` - vim.opt settings (2-space indent, relative line numbers, treesitter folding)
- `lua/config/maps.lua` - Keymaps (Ctrl-hjkl window nav, jk/kj escape, leader-w save, leader-q quit)
- `lua/config/functions.lua` - Custom utilities (EyamlEncrypt, GenCommitMsg)
- `lua/config/diagostic.lua` - Diagnostic configuration and signs
- `lua/config/plugins/*.lua` - Individual plugin configurations

## Key Custom Features

**EYAML Integration:** `\e` in visual mode encrypts/decrypts selected YAML text using the external `eyaml` CLI tool. Detects `ENC[` pattern to toggle encrypt/decrypt mode.

**Git Commit Message Generation:** `\m` in normal mode calls `git_commit_msg.py` script to generate commit messages.

## LSP & Tooling (mason.lua)

**LSP Servers:** cssls, eslint, html, jsonls, ts_ls, pyright, tailwindcss, yamlls, ruff

**Formatters:** prettier, stylua, isort, black, eslint_d, pylint

**Python Setup:** Ruff handles linting/formatting, Pyright for type checking with import organization disabled.

## External Dependencies

- `eyaml` CLI tool (for YAML secret encryption)
- `git_commit_msg.py` script (external commit helper)
- Python debugpy (for DAP debugging)

## Commit Guidelines

Follow conventional commits (feat:, fix:, chore:). Do not include references to Claude or AI assistants in commit messages.
