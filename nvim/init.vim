" Fold Settings {{{
augroup filetype_vim This is used to clear the group
autocmd!
autocmd FileType vim,lua setlocal foldmethod=marker foldlevel=0
augroup END
" }}}

let g:use_lsp = v:true
if has('nvim-0.5.0')

lua << EOF
local ok, ret = pcall(require, 'plenary.reload')
if not ok then
  print("Planery Not Available"..ret)
else
    ret.reload_module("vd.", true)
end
    -- for k in pairs(package.loaded) do
    --   if k:match('vd.%a') then
    --       print("Removing "..k)
    --     package.loaded[k] = nil
    --   end
    -- end
EOF

    lua require('vd.options').global_options()
    lua require('vd.autocmds').global_autocmds()
    lua require('vd.keymaps').global_keymaps()
    lua require('vd.packer_config')

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost *vd/*.lua source <afile> | PackerCompile
    augroup end

endif

" DISABLED : Leader {{{
" let mapleader=","   " leader is comma
" let maplocalleader="\<space>"
" cmap w!! w !sudo tee > /dev/null %

" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" }}}

" DISABLED: Set Options {{{
" if &compatible
 " set nocompatible
" endif

" Allow saving of files as sudo when I forgot to start vim using sudo
" set colorcolumn=96

" if exists('+termguicolors')
  " set termguicolors
" endif

" set guifont=Droid\ Sans\ Mono:h20

"set t_Co=16
" set mouse=a                 " let the mouse wheel scroll page, etc

" set cmdheight=1
" set nostartofline           " Do not jump to first character with page commands.
" set relativenumber          " Set Relative File Number
" set splitright              " Open new split panes to right and below
" set splitbelow
" set noshowmode              " hide the mode (airline will show instead)
" set guioptions=             " remove scrollbars, etc
" set scrolloff=1             " start scrolling when near the last line/col
" set sidescrolloff=5         " Scrolling Offset
" set autoread                " Read changes from file system
" set undofile                " Enable undo persistence across sessions

" set updatetime=300          " Got this from https://github.com/neoclide/coc.nvim
" set shortmess+=c

" Don't pass messages to |ins-completion-menu|.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes

" Tabs and Spaces
" set tabstop=4       " number of visual spaces per TAB
" set softtabstop=4   " number of spaces in tab when editing
" set shiftwidth=4    " number of spaces to use for autoindent
" set shiftround
" set expandtab       " tabs are space
" set autoindent
" set copyindent      " copy indent from the previous line

" Show PUM for wild card menu eg. :e <TAB>
" if has('nvim')
"     set wildoptions=pum
" endif

" set hidden                   " Have unsaved buffer somewhere is the session
" set number                   " show line number
" set showcmd                  " show command in bottom bar
" set cursorline               " highlight current line
" set wildmenu                 " visual autocomplete for command menu
" set wildignore=".git/*,.clangd/*"
" set showmatch                " highlight matching brace
" set laststatus=2             " window will always have a status line
" set nobackup
" set noswapfile

" set incsearch       " search as characters are entered
" set hlsearch        " highlight matches
" set ignorecase      " ignore case when searching
" set smartcase       " ignore case if search pattern is lower case

" set foldenable          " Folding Enable
" set foldlevelstart=10   " default folding level when buffer is opened
" set foldnestmax=10      " maximum nested fold
" set foldmethod=syntax   " fold based on indentation

" }}}

" DISABLED: Autocommands {{{
" augroup vimrc_autocommands
"   autocmd!

"   " Specify some maps for filenames to filetypes
"   autocmd BufNewFile,BufRead *pylintrc set filetype=cfg

"   " Only use cursorline for current window, except when in diff mode
"   autocmd WinEnter,FocusGained * if !&diff | setlocal cursorline | endif
"   autocmd WinLeave,FocusLost   * if !&diff | setlocal nocursorline | endif
"   " autocmd OptionSet diff call personal#init#toggle_diff()

"   " When editing a file, always jump to the last known cursor position.
"   " autocmd BufReadPost * call personal#init#go_to_last_known_position()

"   " Set keymapping for command window
"   autocmd CmdwinEnter * nnoremap <buffer> q     <c-c><c-c>
"   autocmd CmdwinEnter * nnoremap <buffer> <c-f> <c-c>

"   " Close preview after complete
"   autocmd CompleteDone * if pumvisible() == 0 | silent! pclose | endif
"   autocmd FileType help nnoremap <silent> q :bd<CR>
"   autocmd FileType vimcmake nnoremap <silent> q :q<CR>
"   autocmd FileType fzf nmap <silent> q a<C-c>
"   autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
" augroup END
" }}}

" Command & Mappings {{{

" DISABLED: ToggleQuickFix {{{
" function! ToggleQuickFix()
"     if empty(filter(getwininfo(), 'v:val.quickfix'))
"         copen
"     else
"         cclose
"     endif
" endfunction
" nnoremap <F6> :calol ToggleQuickFix()<cr>
" }}}

" Disable minimise
" nnoremap <c-z> <nop>
" nnoremap Q <Nop>

" This is super helpful
" In virual mode while pasting, don't replace the buffer contents
" vnoremap <leader>p "_dP
" vnoremap <leader>+p "_d+P
" nnoremap \ ,

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" command! Q q
" command! W w
" command! WQ wq
" command! Wq wq

" Auto Pairs {{{
inoremap (; ();<C-c>hi
inoremap (, (),<C-c>hi
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
" }}}

" Copy till end of line
nnoremap Y  yg_

" faster exiting from insert mode (-noremap to allow for abbrevs to work)
" inoremap jk <esc>
" cnoremap jk <esc>

" move up/down consider wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>

" split navigation
nnoremap <silent> <c-j> <c-w><c-j>
nnoremap <silent> <c-k> <c-w><c-k>
nnoremap <silent> <c-l> <c-w><c-l>
nnoremap <silent> <c-h> <c-w><c-h>

" split navigation
nnoremap <silent> <m-j> <c-w><c-j>
nnoremap <silent> <m-k> <c-w><c-k>
nnoremap <silent> <m-l> <c-w><c-l>
nnoremap <silent> <m-h> <c-w><c-h>

" nnoremap gf :edit <cfile><cr>

" }}}

" Leader based Mappings {{{

" edit/reload vimrc
" nnoremap <leader>ev <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/", search_dirs = {".", "lua"}  }<CR>
" nnoremap <C-n> <cmd>lua require('telescope.builtin').file_browser()<CR>


" nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

nmap <leader>et :e ~/.tmux.conf<CR>
nmap <leader>ez :e ~/.zshrc<CR>

" fast save and close
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nnoremap <leader>Q :only<CR>

" fix indentation for entire file which we usually do
nnoremap <leader>i mzgg=G`z<CR>

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" move through grep results
" nmap <silent> <right> :cnext<CR>
" nmap <silent> <left> :cprev<CR>

" buffers
nnoremap <leader>bd :bd<CR>

" Buffer navigation
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" }}}

" DISABLED: ALE {{{
" We shouldn't check for runtimepath path
" let g:ale_disable_lsp = 1
" let g:ale_set_quickfix = 1
" let g:ale_fixers = {
      " \   'cpp': [
      " \       'clang-format',
      " \   ],
      " \   'python': [
      " \        'autopep8'
      " \   ]
      " \}
" nnoremap <leader>lf :ALEFix<CR>

" nmap <silent> [l <Plug>(ale_previous_wrap)
" nmap <silent> ]l <Plug>(ale_next_wrap)
" }}}

" DISABLED: vim-plug {{{
call plug#begin()

" Plug 'github/copilot.vim'

" Plug 'puremourning/vimspector'
" Toggle Terminal
" Plug 'caenrique/nvim-toggle-terminal'

" Rust Language
" Plug 'rust-lang/rust.vim'

" Caffe Model Prototxt
" Plug 'chiphogg/vim-prototxt'

" We can use Telescope for file browser
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plug 'lervag/vimtex'
" Plug 'dense-analysis/ale'
" Plug 'ludovicchabant/vim-gutentags'

" Plug 'lifepillar/vim-cheat40'

" Plug 'christoomey/vim-tmux-runner'
" " Plug 'justinmk/vim-sneak'

" Show tags in right
" Plug 'majutsushi/tagbar'

" To mazimize split
" Plug 'szw/vim-maximizer'
"
" Plugin for Neoformat that formats all programs :Neoformat
" Plug 'sbdchd/neoformat'

" Awesome Text Object Support is given here
" Study this often
" Plug 'wellle/targets.vim'

" Smooth PageUp, PageDown, OnePageUp, OnePageDown
" Plug 'psliwka/vim-smoothie'

" Provid Autocompletion from other tmux panes in Coc
" Plug 'wellle/tmux-complete.vim'

" Rainbox Parenthesis
" Plug 'luochen1990/rainbow'

" Plug 'tmux-plugins/vim-tmux-focus-events'

" My Own Plugins for CMAKE
" Plug '~/Data/vimrcs/vim-cmake'
" Plug 'vignesh0025/vim-cmake'
" Plug 'cdelledonne/vim-cmake'

" Provides more features around / and ? and all
Plug 'haya14busa/incsearch.vim'

" Treesitter Themes
" Plug 'RRethy/nvim-base16' " Includes treesitter support
" Plug 'sainnhe/gruvbox-material'
" Plug 'shaunsingh/nord.nvim'
" Plug 'dracula/vim', { 'as': 'dracula' } " as -> install in dracula folder

" Treesitter not supported yet
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'ayu-theme/ayu-vim'
" Plug 'whatyouhide/vim-gotham'
" Plug 'nanotech/jellybeans.vim'

" Plug 'fedorenchik/qt-support.vim'

" THis colors the first letter for using f/F/t/T
" Plug 'unblevable/quick-scope'

" Tmux Navigator
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmux-plugins/vim-tmux'

" syntax highlighting
" Plug 'peterhoeg/vim-qml'
" Plug 'artoj/qmake-syntax-vim'
" Plug 'octol/vim-cpp-enhanced-highlight'

" auto complete
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
" Plug 'davidhalter/jedi-vim' " Used by YouCompleteMe
" Plug 'ervandew/supertab' " Just Tab Autocompletion

" For using clangd-format with C/CPP
" Plug 'chiel92/vim-autoformat'
" Plug 'nvie/vim-flake8' " pip install flake8 and <F7> key to check py file

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Plug 'dkprice/vim-easygrep'

" Note Taking
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-notes'

" editing
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'

" Align items in good tabular format :Tab /=   " Align using equal =
" Plug 'godlygeek/tabular'

" Give repeat support using dot(.) for different operations
" Plug 'tpope/vim-repeat'

" Shortcut mapping using brackets like ]<space> and [<space> and yob
" Plug 'tpope/vim-unimpaired'

" better statusline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Automatic selection of indentation
" Plug 'tpope/vim-sleuth'

" git management plugin
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" Plug 'bfredl/nvim-ipy'

"Plug 'gabrielelana/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'plasticboy/vim-markdown'

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" Plug 'michaeljsmith/vim-indent-object'

"Plug 'jackguo380/vim-lsp-cxx-highlight'

" Plug 'vhdirk/vim-cmake'
" Plug 'easymotion/vim-easymotion'

" This plugin outputs function signature in command line from coc.nvim
" Plug 'Shougo/echodoc.vim'

"
" Plug 'luukvbaal/stabilize.nvim'

"" Remap for do codeAction of selected region
" if g:use_lsp == v:true
"   if has('nvim-0.5.0')
"     Plug 'neovim/nvim-lspconfig'
"     Plug 'nvim-lua/completion-nvim'
"     Plug 'prabirshrestha/vim-lsp'
"     Plug 'mattn/vim-lsp-settings'
"   else
"     echom "No NVIM Nightly"
"   endif
" else
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
" endif


" if has('nvim-0.5.0')
"   " Plug 'nvim-lua/plenary.nvim'
"   " Plug 'nvim-telescope/telescope.nvim'
"   " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"   " Plug 'bfredl/nvim-luadev'
"   " let g:vimsyn_embed = 'l'
"   " Plug '~/.config/nvim/plugins/ColorChange'
" else
"   echom "No neovim nightly"
" endif

call plug#end()
" }}} vim-plug

" LUADEV {{{
if &runtimepath =~? 'luadev'
  nmap <leader>dr <Plug>(Luadev-RunLine)
  vmap <leader>dr <Plug>(Luadev-Run)
endif
" }}}

" DISABLED: ECHODOC {{{
if &runtimepath =~? 'echodoc'
  " let g:echodoc#enable_at_startup = 1
endif
" }}}

" Vim-Maximiser {{{
if &runtimepath =~? 'vim-maximizer'
      let g:maximizer_set_default_mapping = 0
      nnoremap <silent> <c-w>z :MaximizerToggle!<CR>
endif
"}}}

" Tag Bar {{{
if &runtimepath =~? 'tagbar'
  nmap <F9> :TagbarToggle<CR>
endif
" }}}

" Rainbox Bracket {{{
if &runtimepath =~? 'rainbow'
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
endif
" }}}

" DISABLED: Airline {{{
if &runtimepath =~? 'vim-airline'
    " let g:airline_powerline_fonts = 1

    " " Buffers at top is shown by the below
	" " let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
    " let g:airline#extensions#tabline#enabled = 1
    " let g:airline#extensions#tabline#buffer_nr_show = 1
    " let g:airline#extensions#ale#enabled = 1
    " let g:airline#extensions#gutentags#enabled = 1
    " let g:airline#extensions#fugitiveline#enabled = 1
    " let g:airline#extensions#fzf#enabled = 1
    " let g:airline#extensions#vimtex#enabled = 1

    " let g:Powerline_symbols = 'fancy'
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = ''
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = ''
endif
" }}}

" Cpp Enhanced Highlighting {{{
if &runtimepath =~? 'vim-cpp-enhanced-highlight'
  let g:cpp_class_scope_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_class_scope_highlight = 1
  let g:cpp_concepts_highlight = 1
  let g:cpp_posix_standard = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_experimental_simple_template_highlight = 1
endif
" }}}

" Flake8 {{{
if &runtimepath =~? 'vim-flake8'
  let g:flake8_show_in_gutter=1
  let g:flake8_show_in_file=1
endif
" }}}

" DISABLED: UltiSnips {{{
if &runtimepath =~? 'ultisnips'
  " Remove default mappings to avoid conflict. UltiSnips is used by
  " coc-snippets. May be find a way to migrate to ultisnips fully
  " let g:UltiSnipsExpandTrigger = "<NUL>"
  " let g:UltiSnipsJumpForwardTrigger  = "<NUL>"
  " let g:UltiSnipsJumpBackwardTrigger = "<NUL>"
  " let g:UltiSnipsListSnippets        = "<NUL>"
  " let g:UltiSnipsUsePythonVersion = 3
endif
" }}}

" DISABLED Telescope {{{
if &runtimepath =~? "telescope.nvim"
  nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
endif
" }}}

" Ripgrep & FZF {{{
" We can use :grep to directly search files and go into quickfix mode using
" :cwin
if executable('rg') " set Rg as the grep command
    " Note we extract the column as well as the file and line number
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    "set grepformat=%f:%l:%c%m

    " THis is for :Rg command
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" --smart-case '
          \   .shellescape(<q-args>), 1, { 'options': '--color hl:123,hl+:222' }, 0)
endif


if &runtimepath =~? 'fzf.vim'

    let g:rg_command = 'rg --vimgrep -S'
    " Make FZF use rg. THis makes it extremely fast
    " let $FZF_DEFAULT_COMMAND = 'rg --files -l --smart-case'
    let $FZF_DEFAULT_COMMAND = ''

    augroup hide_fzf_statusline
        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noruler
                    \| autocmd BufLeave <buffer> set laststatus=2 ruler
    augroup END

    " Jump to existing window if possible
    let g:fzf_buffers_jump = 1

    " nnoremap <c-p> :Files<CR>
    " nnoremap <m-p> :Buffers<CR>
    nnoremap <m-P> :GFiles?<CR>
    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-s': 'split',
                \ 'ctrl-v': 'vsplit'
                \}

    " mappings
    " nnoremap <C-f> :BLines<CR>

    " nnoremap <F7> :Maps<CR>
    " nnoremap <F8> :Commands<CR>

    nnoremap <F10> :BTags<CR>
    nnoremap <F11> :BCommits<CR>
    nnoremap <F12> :Commits<CR>

    " don't highlight the current line and selection column
    let g:fzf_colors = {'bg+': ['bg', 'Normal']}
endif
" }}}

" DISABLED: COC.NVIM {{{
if &runtimepath =~? 'coc.nvim'
    let g:coc_global_extensions = [
          \'coc-sumneko-lua',
          \'coc-ultisnips',
          \'coc-snippets',
          \'coc-marketplace',
          \'coc-lists',
          \'coc-gitignore',
          \'coc-git',
          \'coc-actions',
          \'coc-python',
          \'coc-json',
          \'coc-cmake',
          \'coc-clangd'
          \]

    function! s:cocActionsOpenFromSelected(type) abort
        execute 'CocCommand actions.open ' . a:type
    endfunction
    xmap <silent> <space>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <space>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use `[g` and `]g` to navigate diagnostics
    " I think we use ]l and [l via ALE to provide diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        elseif &filetype ==# 'lua'
          execute 'h '.expand('<cword>')
        elseif &filetype ==# 'tex'
          VimtexDocPackage " Got from https://github.com/lervag/dotvim/blob/master/vimrc
        else
            call CocAction('doHover')
        endif
    endfunction

    " Got from https://github.com/lervag/dotvim/blob/master/vimrc
    if exists('*CocActionAsync')
      augroup coc_settings
        autocmd!
        autocmd CursorHold * silent call CocActionAsync('highlight')
      augroup END
    endif

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)

    " Apply AutoFix to problem on the current line.
    nmap <space>f  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    "
    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    nnoremap <silent> <F4>      :call CocAction('runCommand', 'clangd.switchSourceHeader')<cr>
    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>i  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Install Extensions.
    nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " SNIPPETS

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " <CR> - select the first completion item and confirm the completion when no item has been selected
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    " Use <leader>xa for convert visual selected code to snippet
    xmap <silent> <leader>xa  <Plug>(coc-convert-snippet)
    nnoremap <silent> <leader>xe  :<C-u>CocCommand snippets.editSnippets<cr>

    " coc-explorer
    " nmap <C-n> :CocCommand explorer<CR>
endif
" }}}

" Clipboard {{{

if $ENV_WSL == 1
" Download from here https://github.com/equalsraf/win32yank/releases
let g:clipboard = {
         \   'name': 'unnamedplus',
         \   'copy': {
         \      '+': 'win32yank.exe -i --crlf',
         \      '*': 'win32yank.exe -i --crlf',
         \    },
         \   'paste': {
         \      '+': 'win32yank.exe -o --lf',
         \      '*': 'win32yank.exe -o --lf',
         \   },
         \   'cache_enabled': 1,
         \ }
endif

" set clipboard+=unnamedplus
" }}}

"  Italics with tmux fix {{{
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" }}}

" CPP {{{
" Fast header source switch
" https://stackoverflow.com/questions/6639863/vim-split-unless-open
" This is one of the most interesting vim mapping. It opens the header/src
" in new split if not open or if open, switches it it automatically
function! MySplit( fname )
    let bufnum=bufnr(expand(a:fname))
    let winnum=bufwinnr(bufnum)
    if winnum != -1
        " Jump to existing split
        exe winnum . "wincmd w"
    else
        " Make new split as usual
        exe "vsplit " . a:fname
    endif
endfunction

" augroup filetype_c_cpp
" " map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" autocmd!
"autocmd BufEnter,BufNewFile *.c,*,cpp,*.h command! -nargs=1 VSplit :call MySplit("<args>")
"autocmd BufEnter,BufNewFile *.c,*,cpp,*.h map <F4> :VSplit %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" augroup end

" Formatting for CPP
" autocmd FileType cpp set formatprg=clang-format
" autocmd FileType cmake set formatprg=clang-format

" }}}

" Inbuild Terminal Map {{{

" Inbuild Terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+\
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
tnoremap <Esc> <C-\><C-n>

" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" nnoremap <c-\> :call OpenTerminal()<CR>
" }}}

" DISABLED: NERDTree mappings {{{
if &runtimepath =~? 'nerdtree'
  map <M-n> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeIgnore = ['\.pyc$', '__pycache__']
  let NERDTreeWinPos="right"

endif
" }}}

" DISABLED: Clang-format Auto save {{{
" Use clang-format -style=google -dump-config > .clang-format to dump config
" (NOTE: Other styles such as llv, firefox, firefox and all exist. check its
" documentation)

" autocmd FileType *.h,*.cc,*.cpp nnoremap <leader>i :Autoformat<CR>
" autocmd FileType *.h,*.cc,*.cpp vnoremap <leader>i :Autoformat<CR>
" autocmd FileType *.h,*.cc,*.cpp nnoremap == v$:Autoformat<CR>
" autocmd FileType *.h,*.cc,*.cpp vnoremap = :echo "test"<CR>

" " Set the default format tools
"autocmd FileType *.h,*.cc,*.cpp vnoremap = :Autoformat<CR>

" }}}

" Trimming White Space Before Save {{{
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
" }}}

" haya14busa/incsearch {{{

" This requires `set hlsearch` which is set above
if &runtimepath =~? 'incsearch'
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)"
endif
" }}}

" Unload Inbuild provide {{{
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
" }}}

" Neoformat {{{
" NOTE: stdin: 1 is very imporant. Otherwise .clang-format is not taken
if &runtimepath =~? 'plugged/neoformat'
    let g:neoformat_cpp_clangformat = {
                \ 'exe': 'clang-format',
                \ 'args': ['-style=file'],
                \ 'stdin': 1
                \}

    let g:neoformat_enabled_cpp = ['clangformat']
    let g:neoformat_enabled_c = ['clangformat']
endif
" }}}

" Hex {{{
" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
" }}}

" Python & Autocmd {{{
if !exists('g:vscode')
    " Windows has no virtualenv
    if has('win32')
        let g:python3_host_prog=expand('C:\Users\Vignesh\PY3\Scripts\python.exe')
    elseif empty($VIRTUAL_ENV)
        let g:python3_host_prog='/usr/bin/python3'
    else
        let g:python3_host_prog=expand('$VIRTUAL_ENV/bin/python')
    endif
    if &runtimepath =~? 'plugged/coc.nvim'
        call coc#config("python.pythonPath", expand("$VIRTUAL_ENV/bin/python"))
    endif
endif
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" QT Console
if &runtimepath =~? 'plugged/nvim-ipy'

    command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --ConsoleWidget.font_size=15 --style solarized-dark --JupyterWidget.include_other_output=True")

    let g:ipy_celldef = '^##' " regex for cell start and end
    nnoremap <leader>jqt :RunQtConsole<Enter>
    nnoremap <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
    nnoremap <leader>jc <Plug>(IPy-RunCell)
    nnoremap <leader>ja <Plug>(IPy-RunAll)
endif
" }}}


" {{{ colorscheme
if &runtimepath =~? 'gruvbox-material'
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    " let g:gruvbox_contrast_dark='hard'
    " let g:gruvbox_contrast_light='hard'
    " let g:gruvbox_italic = 1
    let g:gruvbox_sign_column='bg0'

    " if strftime("%H") < 18 && strftime("%H") > 9
    "   set background=light
    " else
    "   set background=dark
    " endif

    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_diagnostic_line_highlight = 1


    if has('nvim-0.5.0')
        " lua require('vd-plugin').set_init_theme()
    else
        set background=dark
        let g:airline_theme='gruvbox_material'
        colorscheme gruvbox-material
        " match the fold column colors to the line number column
        " must come after colorscheme gruvbox
        highlight clear FoldColumn
        highlight! link FoldColumn LineNr
    endif
endif
" }}}

" DISABLED: Vim - Fugituve {{{
if &runtimepath =~? 'fugitive'
  " nnoremap <leader>gd :Gvdiffsplit<CR>
  " nnoremap <leader>gs :Gstatus<CR>
  " nnoremap <leader>gb :Gblame<CR>
  " nnoremap <leader>gp :Gpush<CR>

  " augroup vimrc_fugitive
  "   autocmd!
  "   autocmd WinEnter index call fugitive#ReloadStatus(-1, 0)
  "   autocmd BufReadPost fugitive:// setlocal bufhidden=delete
  "   autocmd FileType git setlocal foldlevel=1
  "   autocmd FileType git,fugitive nnoremap <buffer><silent> q :bwipeout!<cr>
  "   autocmd FileType fugitive
  "         \ nnoremap <buffer><silent> <f5> :call fugitive#ReloadStatus(-1, 0)<cr>
  " augroup END
endif
" }}}

" Vimtex {{{
if &runtimepath =~? 'vimtex'
  " let g:vimtex_compiler_method = 'tectonic'
  " let g:vimtex_compiler_method = 'latexrun'

  let g:tex_flavor = 'latex'
  let g:Tex_ViewRule_pdf =  'zathura'
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_quickfix_autoclose_after_keystrokes = 2
  "let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_toc_config = {'split_pos':'vert botright'}
  nnoremap <localleader>t :call vimtex#fzf#run()<cr>

  " let g:vimtex_view_general_viewer = 'sumatraPDF.exe'
  " let g:vimtex_view_general_options = '-reuse-instance @pdf'
  " let g:vimtex_view_general_options_latexmk = '-reuse-instance'
  " augroup Vimtex
  "   autocmd!
  "   autocmd QuickFixCmdPost lmake lwindow
  " augroup END
  " if has('win32')
    " let g:vimtex_view_general_viewer = 'mupdf'
    " let g:vimtex_view_mupdf_options = '-r 200'
    " let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
    " let g:vimtex_view_general_options = '-reuse-instance @pdf'
    " let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    " let g:vimtex_view_general_options
    "             \ = '-reuse-instance -forward-search @tex @line @pdf'
    "             \ . ' -inverse-search "' . exepath(v:progpath)
    "             \ . ' --servername ' . v:servername
    "             \ . ' --remote-send \"^<C-\^>^<C-n^>'
    "             \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
    "             \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
    "             \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
  " endif
  "
  augroup Texspell
    autocmd!
    autocmd! BufEnter,BufNewFile *.tex setlocal spell spelllang=en_us
  augroup end

  let g:vimtex_latexmk_options = '-pdf -verbose -bibtex -file-line-error -synctex=1 -interaction=nonstopmode'
  if has('nvim')
    "let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_latexmk_progname = 'nvr'
  " else
  "   if empty(v:servername) && exists('*remote_startserver')
  "     call remote_startserver('VIM')
  "   endif
  endif
endif


" }}}

" function! UpdateBackground()
"    if g:colors_name =~? 'ayu'
"         if &background=~?'dark'
"             let ayucolor="mirage"
"         else
"             let ayucolor="light"
"         endif
"         colorscheme ayu
"     endif
" endfunction

" noremap <silent> <F2> :call ChangeTheme()<CR>
" source ~/.config/nvim/autoload/setcolors.vim

" autocmd OptionSet background call UpdateBackground()

" temp
set path+=**

" One of the brilliant & brilliant mapping I ever did
cnoremap <leader>f <C-R>=expand('%:p:h:t')<CR>
" function! M    yfunc()
  " return expand('%:p:h:t')
" endfunction
" cnoremap <leader>f <C-R>=Myfunc()<CR>

function! Mysubstitute(name)
  return '$'.a:name
  " return system('ls '.a:name)
endfunction

" augroup GF_GROUP
"   au!
"   autocmd BufEnter,BufNewFile,BufAdd *.txt,*.test set isfname-==
"   autocmd BufEnter,BufNewFile,BufAdd *.txt,*.test set isfname+={
"   autocmd BufEnter,BufNewFile,BufAdd *.txt,*.test set isfname+=}
"   autocmd BufEnter,BufNewFile,BufAdd *.txt,*.test set includeexpr=Mysubstitute(v:fname)
" augroup END


function! CompleteFileName(cnt, basename) abort
  if a:cnt == 1
    " Read from the first character and give the output
    let l:line = getline('.')
    let l:pos = match(l:line, '[= ]')
    while l:pos != -1
      let l:temp = match(l:line, '[= ]', l:pos + 1)
      if l:temp == -1
        break
      else
        let l:pos = l:temp
      endif
    endwhile

    let l:processed_path = strpart(l:line, l:pos + 1)
    let l:command = 'test -f $'.l:processed_path
    call system(l:command)
    if v:shell_error == 0
      echom "Already a file: ".l:processed_path
      return -3
    endif

    let l:command = 'ls '.'$'.l:processed_path
    let s:command = system(l:command)
    if v:shell_error == 0
      if l:line[len(l:line)-1] == "/"
        let s:files = split(s:command)
      else
        let s:files = map(split(s:command),'"/".v:val' )
      endif
      return col('.')
    else
      return -3
    endif
  else
    return {'words': s:files}
  endif
endfunction

func! Test(cnt, string) abort
    if a:cnt == 1
        let l:line = getline('.')
        let l:pos = match(l:line, '[= ]')
        while l:pos != -1
            let l:temp = match(l:line, '[= ]', l:pos + 1)
            if l:temp == -1
                break
            else
                let l:pos = l:temp
            endif
        endwhile

        let l:processed_path = strpart(l:line, l:pos + 1)
        echo l:processed_path
        let l:expr = matchstr(l:processed_path,'{\w\+}')
        let l:path = substitute(l:processed_path, l:expr, environ()[substitute( l:expr, "[{}]", "", "g")], "")
        let s:files = getcompletion(l:path, 'file')
        if len(s:files) == 0
            return -3
        else
            return col('.')
        endif
    else
        return {'words': s:files}
    endif
endfunction

augroup COM_GROUP
  au!
  autocmd BufEnter,BufAdd,BufNewFile *.test set completefunc=Test
augroup END

