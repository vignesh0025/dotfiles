local ok,global_config = pcall(require, 'vd.global_config')
if not ok then
  print("ERROR in global_config")
end

-- global_config.test()
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]


return require('packer').startup({function(use)

  -- use {'lewis6991/impatient.nvim', config = function ()
    -- require('impatient')
  -- end}

  -- require('packer_compiled')
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'dstein64/vim-startuptime'

  use {'jremmen/vim-ripgrep', disable=true}
  use 'github/copilot.vim'
  use 'puremourning/vimspector'
  use 'caenrique/nvim-toggle-terminal'

  -- use 'rust-lang/rust.vim'
  -- use 'chiphogg/vim-prototxt'
  -- use 'lervag/vimtex'
  -- use 'majutsushi/tagbar'

  use 'lifepillar/vim-cheat40' -- :TagbarToggle

  use 'wellle/targets.vim' -- Nice Plugin to add more selection

  -- use 'luochen1990/rainbow' -- :RainboxToggle

  use 'christoomey/vim-tmux-runner'
  use 'wellle/tmux-complete.vim'
  use 'tmux-plugins/vim-tmux-focus-events'

  use 'szw/vim-maximizer'
  use 'sbdchd/neoformat' -- :Neoformat
  use 'psliwka/vim-smoothie' -- Smooth Scrolling
  use 'cdelledonne/vim-cmake'

  use {'haya14busa/incsearch.vim', config=function ()
    vim.cmd[[
    set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#
    ]]
  end}

  use 'RRethy/nvim-base16' -- Includes treesitter support
  use 'sainnhe/gruvbox-material'
  use 'shaunsingh/nord.nvim'
  use {'dracula/vim', as = 'dracula' } -- as -> install in dracula folder
  use 'NLKNguyen/papercolor-theme'
  use 'ayu-theme/ayu-vim'
  use 'whatyouhide/vim-gotham'
  use 'nanotech/jellybeans.vim'

  use 'unblevable/quick-scope' -- Highlight first letter to use t/T/f/F

  use 'fedorenchik/qt-support.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'tmux-plugins/vim-tmux'
  use 'peterhoeg/vim-qml'
  use 'artoj/qmake-syntax-vim'
  use 'chiel92/vim-autoformat'
  use 'nvie/vim-flake8'

  -- pip install flake8 and <F7> key to check py file
  -- use {'junegunn/fzf', { run = './install --all' }}
  -- use 'junegunn/fzf.vim'
  -- use 'jremmen/vim-ripgrep'

  -- use 'svermeulen/vimpeccable'
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim',
    config = global_config.telescope_init,
    requires = {
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-file-browser.nvim'}
    }
  }

  use {'sheerun/vim-polyglot',disable=true, config=global_config.polyglot_init}
  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = global_config.treesitter_init,
  }
  use{'nvim-treesitter/playground', after="nvim-treesitter"}

  -- editing
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  use {'dense-analysis/ale', config=global_config.ale_init, disable=true}

  -- Align items in good tabular format :Tab /=   " Align using equal =
  use 'godlygeek/tabular'

  -- Give repeat support using dot(.) for different operations
  use 'tpope/vim-repeat'

  -- Shortcut mapping using brackets like ]<space> and [<space> and yob
  use 'tpope/vim-unimpaired'

  use 'kyazdani42/nvim-web-devicons'
  use {'nvim-lualine/lualine.nvim', config=function ()
    if _G.get_current_lang_server == nil then
      _G.get_current_lang_server = function()
        return vim.lsp.buf_get_clients()[1].name
      end
    end

    local config = require'lualine'.get_config()

    if not vim.tbl_contains(config.sections.lualine_x, _G.get_current_lang_server) then
      config.sections.lualine_x = vim.list_extend({_G.get_current_lang_server},config.sections.lualine_x)
    end
    require'lualine'.setup(vim.tbl_deep_extend("force",config, {
      options = {theme = 'solarized_dark'},
    }))
  end
  }
  use {'kdheepak/tabline.nvim', after="lualine.nvim", config=function ()
    require'tabline'.setup({
      options = {show_bufnr = true}
    })
  end}
  --
  use {'kyazdani42/nvim-tree.lua',
    setup = function ()
      vim.g.nvim_tree_highlight_opened_files = 1
      vim.cmd[[highlight NvimTreeFolderIcon guibg=blue]]
    end,
    config = function() require'nvim-tree'.setup {
      highlight_focused_file = true,
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
      }
    } end
  }

  use {'itchyny/lightline.vim', disable=true}
  use {'vim-airline/vim-airline', disable=true, config = global_config.airline_init }
  use {'vim-airline/vim-airline-themes', after="vim-airline"}
  use {'~/.config/nvim/plugins/ColorChange', after='lualine.nvim'}
  use 'tpope/vim-sleuth'

  use {'tpope/vim-fugitive',  config = global_config.fugitive_init}
  use 'airblade/vim-gitgutter'

  use {'plasticboy/vim-markdown', disable=true}

  use {'vim-pandoc/vim-pandoc', disable=true}
  use {'vim-pandoc/vim-pandoc-syntax', after='vim-pandoc'}

  use 'michaeljsmith/vim-indent-object'
  use 'easymotion/vim-easymotion'

  -- This plugin outputs function signature in command line from coc.nvim

  use {'luukvbaal/stabilize.nvim', disable=true, config=function ()
    require("stabilize").setup()
  end}

  vim.g.vimsyn_embed = 'l'

  -- use {'neovim/nvim-lspconfig', config=global_config.lsp_init, disable=not(vim.g.use_lsp),
  use {"williamboman/nvim-lsp-installer", disable=not(vim.g.use_lsp),
    config=global_config.lsp_server_init,
    requires = {
      "neovim/nvim-lspconfig",
      "ray-x/lsp_signature.nvim",
    }
  }


  use {'ms-jpq/coq_nvim', branch='coq',
    disable=true,
    setup= function ()
      vim.api.nvim_set_var('coq_settings',{
        auto_start=true,
        keymap = {jump_to_mark = '<c-j>'}
      })
    end,
    requires = {
      {'ms-jpq/coq.artifacts', branch='artifacts'},
      {'ms-jpq/coq.thirdparty', branch='3p'}
    }}

  use {'hrsh7th/nvim-cmp', config=global_config.nvim_cmp_init, disable=false,
    requires = {
      "hrsh7th/cmp-buffer",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      {"SirVer/ultisnips", config=global_config.ultisnips_init},
      "honza/vim-snippets",
      "quangnguyen30192/cmp-nvim-ultisnips"
    }}
  -- use {'nvim-lua/completion-nvim', disable=not(vim.g.use_lsp)}
  -- use {'prabirshrestha/vim-lsp', disable=not(vim.g.use_lsp)}
  -- use {'mattn/vim-lsp-settings', disable=not(vim.g.use_lsp)}

  use {'neoclide/coc.nvim', branch = 'release', config=global_config.coc_init,
    disable=vim.g.use_lsp,
    requires = {"Shougo/echodoc.vim", config= function ()
      vim.api.nvim_set_var("echodoc#enable_at_startup", 1)
    end}
  }

  use {'sunjon/shade.nvim', disable=true, config=function ()
    require'shade'.setup()
  end}

  use 'MunifTanjim/nui.nvim'

  use {'Pocco81/TrueZen.nvim', config = function ()
    local true_zen = require("true-zen")
    true_zen.setup()
  end}

  -- use {'~/home/vignesh/dotfiles/nvim/plugins/NotesPlugin', disable=true}
end})
