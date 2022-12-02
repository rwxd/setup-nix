local augroup = vim.api.nvim_create_augroup
RWXDGroup = augroup('rwxd', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

-- Python
autocmd({"BufWritePre"}, {
	group = RWXDGroup,
	pattern = "*.py",
	command = "Black",
})

-- Rust
-- autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--     group = RWXDGroup,
--     pattern = "*.rs",
--     callback = function()
--         require("lsp_extensions").inlay_hints{}
--     end
-- })
