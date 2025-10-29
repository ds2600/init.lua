-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-commentary'
  use {
      'github/copilot.vim',
      config = function() 
          vim.g.copilot_enabled = true
      end
  }
  
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Recommended, not required.
    
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.cmd("colorscheme tokyonight")
        end
    }

    use {
		'daltonmenezes/aura-theme',
		rtp = 'packages/neovim',
		config = function()
			vim.cmd("colorscheme aura-dark") -- Or any Aura theme available
		end
	}
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"} }
    }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip/loaders/from_vscode").lazy_load()
        end
    }

end)
