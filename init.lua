#! /usr/bin/env lua
--
-- init.lua
-- Copyright (C) 2024 rmelo <Ricardo Melo <rmelo@ludia.com>>
--
-- Distributed under terms of the MIT license.
--

--for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config"), [[v:val =~ '\.lua$']])) do
--	require("config." .. file:gsub("%.lua$", ""))
--end
require("config.settings")
require("config.lazy")
require("config.functions")
require("config.maps")
