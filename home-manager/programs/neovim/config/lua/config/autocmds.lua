local augroup = vim.api.nvim_create_augroup
RWXDGroup = augroup('rwxd', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

-- black on save
autocmd({"BufWritePre"}, {
	group = RWXDGroup,
	pattern = "*.py",
	command = "Black",
})


-- terraform fmt on save
autocmd({"BufWritePre"}, {
	group = RWXDGroup,
	pattern = "*.tf",
	callback = function()
		vim.cmd("silent! !terraform fmt")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })

function go_org_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
	  for _, r in pairs(res.result or {}) do
		if r.edit then
		  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
		  vim.lsp.util.apply_workspace_edit(r.edit, enc)
		end
	  end
	end
end

-- goimport on save
autocmd({"BufWritePre"}, {
	group = RWXDGroup,
	pattern = "*.go",
	callback = function()
		go_org_imports()
	end,
})

-- gofmt on save
autocmd({"BufWritePre"}, {
	group = RWXDGroup,
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.format()
	end,
})

