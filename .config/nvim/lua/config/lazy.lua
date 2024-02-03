local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'ms-jpq/chadtree',
		branch = 'chad',
		build = 'python -m chadtree deps',
	},
	"nvim-lua/plenary.nvim",
	{
		'tanvirtin/vgit.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	'NvChad/nvim-colorizer.lua',
	'marko-cerovac/material.nvim',
	{
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
}
}

require("lazy").setup(plugins, opts)
