-- comment.lua
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {},
	config = function()
		require("Comment").setup()
	end,
}
