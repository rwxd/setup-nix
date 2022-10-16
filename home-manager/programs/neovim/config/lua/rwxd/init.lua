require("rwxd.telescope")
require("rwxd.comment")
require("rwxd.lsp")
require("rwxd.refactoring")
require("rwxd.treesitter")
require("rwxd.theme")
require("rwxd.debugger")
require("rwxd.keymap")

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, 'plenary') then
	RELOAD = require('plenary.reload').reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
