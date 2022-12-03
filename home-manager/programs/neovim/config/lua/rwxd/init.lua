require("rwxd.packer")
require("rwxd.settings")
require("rwxd.git")
require("rwxd.theme")
require("rwxd.telescope")
require("rwxd.lsp")
require("rwxd.treesitter")
require("rwxd.comments")
require("rwxd.refactoring")
require("rwxd.harpoon")
require("rwxd.autocmd")
require("rwxd.pre_commit")
require("rwxd.quickfixlist")
require("rwxd.rainbow_parenthesis")
require("rwxd.vimtest")
require("rwxd.misc")

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
