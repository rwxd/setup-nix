return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

	-- use("junegunn/rainbow_parentheses.vim")
	use("luochen1990/rainbow")

	-- theme
	use { "catppuccin/nvim", as = "catppuccin" }

	-- statusline plugins
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")

	-- show bad whitespace in red
	use("ntpeters/vim-better-whitespace")

	-- indent tab blank
	use("lukas-reineke/indent-blankline.nvim")

	-- Git integration
	use("tpope/vim-fugitive")
	use("junegunn/gv.vim")
	use("rhysd/git-messenger.vim")
	use ("lewis6991/gitsigns.nvim")

	-- Easy test shortcuts
	use("vim-test/vim-test")

	-- diagrams
	use("terrastruct/d2-vim")
	use("weirongxu/plantuml-previewer.vim")
	use("tyru/open-browser.vim")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("mfussenegger/nvim-dap-python")
	use("leoluz/nvim-dap-go")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	-- use("nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	use("nvim-telescope/telescope-file-browser.nvim")

	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	use("ThePrimeagen/harpoon")
	use("ThePrimeagen/refactoring.nvim")

	use("vimwiki/vimwiki")

	use("mbbill/undotree")

	-- comment
	use("numToStr/Comment.nvim")
	use("folke/todo-comments.nvim")

	-- markdown preview
	-- :GlowInstall
	use("ellisonleao/glow.nvim")
	use("dhruvasagar/vim-table-mode")

	-- Terraform
	use("hashivim/vim-terraform")

	-- Prettier
	use("sbdchd/neoformat")

	-- Python
	use("psf/black")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP Stuff
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("onsails/lspkind-nvim")
    use("simrat39/inlay-hints.nvim")

	-- Go
	use("ray-x/go.nvim")

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- use("github/copilot.vim")
	use {
	  "zbirenbaum/copilot.lua",
	  event = "VimEnter",
	  config = function()
		require("copilot").setup({
		  suggestion = {
		  	enabled = true,
		  	auto_trigger = false,
		  	debounce = 75,
		  	keymap = {
		  		jump_prev = "<M-j>",
		  		jump_next = "<M-k>",
		  		dismiss = "<C-CR>",
		  		accept = "<M-l>",
		  		accept_word = false,
		  		accept_line = false,
		  	},
		  },
		  filetypes = {
		  	yaml = true,
		  	markdown = true,
		  	help = true,
		  	gitcommit = true,
		  	gitrebase = true,
		  	hgcommit = true,
		  	svn = true,
		  	cvs = true,
		  	["."] = true,
		  },
		  copilot_node_command = vim.g.copilot_node_command,
		})
	  end,
	}
	use({
	  "jackMort/ChatGPT.nvim",
		config = function()
		  require("chatgpt").setup({
			api_key_cmd = "gopass show --password private/openai_token",
		    }
	          )
		end,
		requires = {
		  "MunifTanjim/nui.nvim",
		  "nvim-lua/plenary.nvim",
		  "nvim-telescope/telescope.nvim"
		},
	})
	use {
	  "folke/which-key.nvim",
	  config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
end)
