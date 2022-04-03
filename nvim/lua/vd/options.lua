local global_options = function ()
    if(vim.opt.compatible) then
        vim.opt.compatible        = false
    end
    vim.opt.listchars             = 'eol:↵,trail:~,tab:▷ ,nbsp:␣,extends:◣,precedes:◢'
    vim.opt.list                  = true
    -- vim.opt.colorcolumn           = 0
    vim.opt.termguicolors         = true
    vim.opt.guifont               = "Droid Sans Mono:h20"
    vim.opt.mouse                 = 'a'
    vim.opt.cmdheight             = 1
    vim.opt.startofline           = false
    vim.opt.relativenumber        = true
    vim.opt.splitright            = true
    vim.opt.splitbelow            = true
    vim.opt.showmode              = false
    vim.opt.scrolloff             = 1
    vim.opt.sidescrolloff         = 5
    vim.opt.autoread              = true
    vim.opt.undofile              = true
    vim.opt.updatetime            = 300
    vim.opt.shortmess:append('c')
    vim.opt.signcolumn            = "auto"
    vim.opt.tabstop               = 4                     -- number of visual spaces per TAB
    vim.opt.softtabstop           = 4                     -- number of spaces in tab when editing
    vim.opt.shiftwidth            = 4                     -- number of spaces to use for autoindent
    vim.opt.shiftround            = true
    vim.opt.expandtab             = true                  -- tabs are space
    vim.opt.autoindent            = true
    vim.opt.copyindent            = true                  -- copy indent from the previous line
    vim.opt.wildoptions           = "pum"
    vim.opt.hidden                = true                  -- Have unsaved buffer somewhere is the session
    vim.opt.number                = true                  -- show line number
    vim.opt.showcmd               = true                  -- show command in bottom bar
    vim.opt.cursorline            = true                  -- highlight current line
    vim.opt.wildmenu              = true                  -- visual autocomplete for command menu
    vim.opt.wildignore            = "git/*,.clangd/*"
    vim.opt.showmatch             = true                  -- highlight matching brace
    vim.opt.laststatus            = 2                     -- window will always have a status line
    vim.opt.backup                = false
    vim.opt.swapfile              = false
    vim.opt.incsearch             = true                  -- search as characters are entered
    vim.opt.hlsearch              = true                  -- highlight matches
    vim.opt.ignorecase            = true                  -- ignore case when searching
    vim.opt.smartcase             = true                  -- ignore case if search pattern is lower case
    vim.opt.foldenable            = true                  -- Folding Enable
    vim.opt.foldlevelstart        = 10                    -- default folding level when buffer is opened
    vim.opt.foldnestmax           = 10                    -- maximum nested fold
    vim.opt.foldmethod            = "syntax"              -- fold based on indentation
end

return {
    global_options = global_options
}
