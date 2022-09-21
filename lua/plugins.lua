local packer = require("packer")
packer.startup({
  function(use)
   -- Packer 可以管理自己本身
    use("wbthomason/packer.nvim")
   --你的插件列表...
    use("folke/tokyonight.nvim")
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    }) 
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ "nvim-treesitter/nvim-treesitter"})
    --mason-lspconfig.nvim bridges mason.vim with the lispconfig plugin
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
  end,
  config = {
    max_jobs= 16,
    display = {
      open_fn = function()
       return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

pcall(
  vim.cmd,
  [[
    augroup fold_fix
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
    augroup end
  ]]
)

