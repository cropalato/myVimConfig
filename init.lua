#! /usr/bin/env lua
--
-- init.lua
-- Copyright (C) 2024 rmelo <Ricardo Melo <rmelo@ludia.com>>
--
-- Distributed under terms of the MIT license.
--

-- Enable faster loader
vim.loader.enable()

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/config", [[v:val =~ '\.lua$']])) do
	require("config." .. file:gsub("%.lua$", ""))
end
