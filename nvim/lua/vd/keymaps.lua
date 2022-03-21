function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

local global_keymaps = function ()
    vim.g.mapleader=","
    vim.g.maplocalleader=[[\<space>]]

    vim.api.nvim_set_keymap("c","w!!", "w !sudo tee > /dev/null %", {})
    vim.api.nvim_set_keymap("c","W", "w", {})

    -- Vim Function {{{
    -- function! ToggleQuickFix()
    -- if empty(filter(getwininfo(), 'v:val.quickfix'))
    --     copen
    -- else
    --     cclose
    -- endif
    -- endfunction
    -- }}}
    _G.ToggleQuickFix = function ()
        if 1==vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) then
            vim.cmd("copen")
        else
            vim.cmd("cclose")
        end
    end
    vim.api.nvim_set_keymap("n","<F6>",":call v:lua.ToggleQuickFix()<cr>", {
        noremap=true,
        silent=true
    })

    vim.api.nvim_set_keymap("n","<c-z>","<nop>", {noremap=true})
    vim.api.nvim_set_keymap("n","Q","<nop>", {noremap=true})

    vim.api.nvim_set_keymap("v","<leader>p","_dP",{noremap=true})
    vim.api.nvim_set_keymap("v","<leader>+p","_d+P",{noremap=true})

    vim.api.nvim_set_keymap("n",[[\]], [[,]] , {noremap=true})

    vim.api.nvim_set_keymap("i","jk","<esc>", {noremap=true})
    vim.api.nvim_set_keymap("c","jk","<esc>", {noremap=true})

    vim.api.nvim_set_keymap("t","<esc>",[[<C-BSlash><C-n>]], {noremap=true})
end

local telescope_keymaps = function ()
    vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true});
    vim.api.nvim_set_keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true});
    vim.api.nvim_set_keymap("n", "gR", "<cmd>lua require('telescope.builtin').grep_string()<cr>", {noremap = true});
    vim.api.nvim_set_keymap("n", "<leader>ev",[[<cmd>lua require'telescope.builtin'.fd{cwd="~/.config/nvim/", search_dirs = {".", "lua"}}<CR>]], {noremap=true})
    -- vim.api.nvim_set_keymap("n", "<leader>ev",[[<cmd>lua require'telescope.builtin'.find_files{cwd="~/.config/nvim/", search_dirs = {".", "lua"}}<CR>]], {noremap=true})

    vim.api.nvim_set_keymap("n","<C-n>",[[:Telescope file_browser<CR>]],{noremap=true})
    vim.api.nvim_set_keymap("n","<F1>",[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],{noremap=true})

    vim.api.nvim_set_keymap("n","<F7>",[[<cmd>lua require('telescope.builtin').keymaps()<CR>]],{noremap=true})
    vim.api.nvim_set_keymap("n","<F8>",[[<cmd>lua require('telescope.builtin').commands()<CR>]],{noremap=true})

    -- LSP Related keymaps
    vim.api.nvim_set_keymap("n","<space>o",[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],{noremap=true})
    vim.api.nvim_set_keymap("n","gr",[[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],{noremap=true})

    -- NOTE!!:: <leader>_ actually maps to <leader>/
    vim.api.nvim_set_keymap("n","<Bslash>",[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],{noremap=true})
end

local fugitive_keymaps = function ()
    vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Gstatus<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gblame<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Gpush<cr>", {noremap = true})
    vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Gpush<cr>", {noremap = true})
end

-- Disabled: COC {{{
local coc_keymaps = function ()
    vim.api.nvim_set_keymap("x", "<space>a", "<Plug>(coc-codeaction-selected)",{silent=true})
    vim.api.nvim_set_keymap("n", "<space>a", "<Plug>(coc-codeaction-selected)",{silent=true})

    --   " Use <c-space> to trigger completion.
    --   inoremap <silent><expr> <c-space> coc#refresh()
    vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()",{silent=true, expr=true})

    --   TODO: Check ALE
    --   " Use `[g` and `]g` to navigate diagnostics
    --   " I think we use ]l and [l via ALE to provide diagnostics
    --   nmap <silent> [g <Plug>(coc-diagnostic-prev)
    --   nmap <silent> ]g <Plug>(coc-diagnostic-next)

    --   " GoTo code navigation.
    --   nmap <silent> gd <Plug>(coc-definition)
    vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)",{silent=true})

    --   nmap <silent> gy <Plug>(coc-type-definition)
    vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)",{silent=true})

    --   nmap <silent> gi <Plug>(coc-implementation)
    vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implemention)",{silent=true})

    --   nmap <silent> gr <Plug>(coc-references)
    vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)",{silent=true})

    -- {{{ function! s:show_documentation()
    --       if (index(['vim','help'], &filetype) >= 0)
    --         execute 'h '.expand('<cword>')
    --       elseif &filetype ==# 'lua'
    --         execute 'h '.expand('<cword>')
    --       elseif &filetype ==# 'tex'
    --         VimtexDocPackage " Got from https://github.com/lervag/dotvim/blob/master/vimrc
    --       else
    --           call CocAction('doHover')
    --       endif
    --   endfunction
    --   }}}
    _G.coc_show_documentation = function ()
        if vim.fn.index({"vim", "help", "lua"}, vim.o.filetype) >= 0 then
            local cmd = ":h "..vim.fn.expand('<cword>')
            vim.cmd(cmd)
        elseif vim.o.filetype == "tex" then
            vim.cmd("VimtexDocPackage")
        else
            vim.cmd[[call CocAction('doHover')]]
        end
    end

    --   " nnoremap <silent> K :call <SID>show_documentation()<CR>
    vim.api.nvim_set_keymap("n", "K", ":call v:lua.coc_show_documentation()<cr>",{silent=true, noremap=true})

    --   " Symbol renaming.
    --   nmap <leader>rn <Plug>(coc-rename)
    vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)",{silent=true})

    --   " Formatting selected code.
    --   xmap <leader>f  <Plug>(coc-format-selected)
    --   nmap <leader>f  <Plug>(coc-format-selected)
    vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>(coc-format-selected)",{silent=true})
    vim.api.nvim_set_keymap("x", "<leader>f", "<Plug>(coc-format-selected)",{silent=true})

    --   " Apply AutoFix to problem on the current line.
    --   nmap <space>f  <Plug>(coc-fix-current)
    vim.api.nvim_set_keymap("n", "<space>f", "<Plug>(coc-fix-current)",{silent=true})

    --   " Map function and class text objects
    --   " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    vim.api.nvim_set_keymap("x", "if", "<Plug>(coc-funcobj-i)", {})
    vim.api.nvim_set_keymap("o", "if", "<Plug>(coc-funcobj-i)", {})
    vim.api.nvim_set_keymap("x", "af", "<Plug>(coc-funcobj-a)", {})
    vim.api.nvim_set_keymap("o", "af", "<Plug>(coc-funcobj-a)", {})
    vim.api.nvim_set_keymap("x", "ic", "<Plug>(coc-classobj-i", {})
    vim.api.nvim_set_keymap("o", "ic", "<Plug>(coc-classobj-i", {})
    vim.api.nvim_set_keymap("x", "ac", "<Plug>(coc-classobj-a", {})
    vim.api.nvim_set_keymap("o", "ac", "<Plug>(coc-classobj-a", {})


    -- Keys to be executed must be in Double Quotes :h expr-quote ( single quote :h literal-string )
    -- Remap <C-f> and <C-b> for scroll float windows/popups.
    vim.api.nvim_set_keymap("n","<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], {silent=true, nowait=true, expr=true})
    vim.api.nvim_set_keymap("n","<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], {silent  =true, nowait=true, expr=true})
    vim.api.nvim_set_keymap("i","<C-f>", [[coc#float#has_scroll() ? <c-r>=coc#float#scroll(1)<cr> : "\<Right>"]], {silent  =true, nowait=true, expr=true})
    vim.api.nvim_set_keymap("i","<C-b>", [[coc#float#has_scroll() ? <c-r>=coc#float#scroll(0)<cr> : "\<Left>"]], {silent =true, nowait=true, expr=true})
    vim.api.nvim_set_keymap("v","<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], {silent  =true, nowait=true, expr=true})
    vim.api.nvim_set_keymap("v","<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], {silent  =true, nowait=true, expr=true})

    --   " Use CTRL-S for selections ranges.
    --   " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    --   nmap <silent> <C-s> <Plug>(coc-range-select)
    --   xmap <silent> <C-s> <Plug>(coc-range-select)
    vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>(coc-range-select)", {silent=true})
    vim.api.nvim_set_keymap("x", "<C-s>", "<Plug>(coc-range-select)", {silent=true})

    --   function! s:check_back_space() abort
    --       let col = col('.') - 1
    --       return !col || getline('.')[col - 1]  =~# '\s'
    --   endfunction
    vim.api.nvim_set_keymap("i","<TAB>",
        [[pumvisible() ? "\<C-n>" :  coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh() ]],
        {silent=true, expr=true, noremap=true})
    vim.api.nvim_set_keymap("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], {expr=true, noremap=true})

    --   " <CR> - select the first completion item and confirm the completion when no item has been selected
    --   inoremap <silent><expr> <cr>pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    vim.api.nvim_set_keymap("i","<CR>",
        [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        {noremap=true, silent=true, expr=true})

    --   " Use <C-j> for select text for visual placeholder of snippet.
    --   vmap <C-j> <Plug>(coc-snippets-select)
    vim.api.nvim_set_keymap("v", "<c-j>", "<Plug>(coc-snippets-select)", {silent=false})

    --   " Use <C-j> for both expand and jump (make expand higher priority.)
    --   imap <C-j> <Plug>(coc-snippets-expand-jump)
    vim.api.nvim_set_keymap("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)", {silent=false})

    --   " SNIPPETS
    --   " Use tab for trigger completion with characters ahead and navigate.
    --   " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    --   " other plugin before putting this into your config.

    --   " Use <leader>xa for convert visual selected code to snippet
    --   xmap <silent> <leader>xa  <Plug>(coc-convert-snippet)
    --   nnoremap <silent> <leader>xe  :<C-u>CocCommand snippets.editSnippets<cr>
    vim.api.nvim_set_keymap("x", "<leader>xa", "<Plug>(coc-convert-snippet)", {silent = true})
    vim.api.nvim_set_keymap("n", "<leader>xe", ":<C-u>CocCommand snippets.editSnippets<cr>",
        {silent = true, noremap=true})

    --   " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    --   let g:coc_snippet_next = '<c-j>'
    vim.g.coc_snipper_next = '<c-j>'

    --   " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    --   let g:coc_snippet_prev = '<c-k>'
    vim.g.coc_snipper_prev = '<c-k>'

    -- " Use <C-l> for trigger snippet expand.
    -- imap <C-l> <Plug>(coc-snippets-expand)
    vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(coc-snippets-expand)", {})

    --   nnoremap <silent> <F4> :call CocAction('runCommand', 'clangd.switchSourceHeader')<cr>
    vim.api.nvim_set_keymap("n", "<F4>",
        ":call CocAction('runCommand', 'clangd.switchSourceHeader')<cr>", {noremap=true, silent=true})

    --   " Find symbol of current document.
    --   nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    vim.api.nvim_set_keymap("n", "<space>o",":<C-u>CocList outline<cr>",{silent=true,noremap=true})

    --   " Manage extensions.
    --   nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    vim.api.nvim_set_keymap("n","<space>e",":<C-u>CocList extensions<cr>", {noremap=true, silent=true})


    --   " Install Extensions.
    --   nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>
    vim.api.nvim_set_keymap("n","<space>m",":<C-u>CocList marketplace<cr>",{silent=true,noremap=true})

    --   " Show commands.
    --   nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    vim.api.nvim_set_keymap("n","<space>c",":<C-u>CocList commands<cr>",{noremap=true,silent=true})

    --   " Search workspace symbols.
    --   nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    vim.api.nvim_set_keymap("n","<space>s",":<C-u>CocList -I symbols<cr>",{noremap=true,silent=true})

    --   " Show all diagnostics.
    --   nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
    vim.api.nvim_set_keymap("n","<space>d", ":<C-u>CocList diagnostics<cr>", {noremap=true,silent=true})

    --   nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    --   " Do default action for previous item.
    vim.api.nvim_set_keymap("n","<space>j", ":<C-u>CocNext<CR>", {noremap=true,silent=true})

    --   nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    --   " Resume latest coc list.
    vim.api.nvim_set_keymap("n","<space>k", ":<C-u>CocPrev<CR>", {noremap=true,silent=true})

end
---}}}

local nvim_cmp_keymaps = function (cmp)

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    return {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert }),
            {"i", "c"}),
        ['<Tab>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function()
                if cmp.visible() then
                    -- if the current entered data doesn't match anything, move to items
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpForwards"] ~= nil and vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.fn.feedkeys(t("<esc>:call UltiSnips#JumpForwards()<CR>"))
                else
                    vim.fn.feedkeys(t("<tab>"), "n")
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert }),
            {"i", "c"}),
        ['<S-Tab>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
                    -- return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    vim.fn.feedkeys(t("<s-tab>"), "n")
                end
            end,
            s = function()
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    vim.fn.feedkeys(t("<s-tab>"), "n")
                end
            end
        }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false }),
            c = function (fallback)
                if cmp.visible() then
                    if cmp.get_selected_entry() == nil then
                        fallback()
                    else
                        cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false })
                    end
                else
                    fallback()
                end
            end
        })
    }
end

return {
    global_keymaps = global_keymaps,
    telescope_keymaps = telescope_keymaps,
    fugitive_keymaps = fugitive_keymaps,
    coc_keymaps = coc_keymaps,
    nvim_cmp_keymaps = nvim_cmp_keymaps
}
