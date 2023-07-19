return {
  {
    "jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
      require("chatgpt").setup({
		api_key_cmd = "gopass show --password private/openai_token",
	  })
    end,
	dependencies = {
	  "MunifTanjim/nui.nvim",
	  "nvim-lua/plenary.nvim",
	  "nvim-telescope/telescope.nvim"
	},
  }
}
