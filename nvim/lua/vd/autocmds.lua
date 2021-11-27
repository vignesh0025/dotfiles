-- VimIncludeExpr using VimScript {{{
-- function! VimIncludeExpr(name) abort
--   let s:rtp = split(&runtimepath, ",")
--   for path in s:rtp
--     echom path.'/lua/'.a:name
--     if filereadable(path.'/lua/'.a:name.'.lua')
--       return path.'/lua/'.a:name.'.lua'
--     endif
--   endfor
--   return "Not found in path"
-- endfunction
-- }}}
_G.LuaIncludeExpr = function (item)
    local paths = vim.fn.split(vim.o.runtimepath, ",")
    -- NOTE: % is the escape character for dot
    local mod = string.gsub(item,"%.","/")
    print(mod)
    for _, value in ipairs(paths) do
      if vim.fn.filereadable(value.."/lua/"..mod..".lua") then
        return value.."/lua/"..mod..".lua"
      end
    end
end

local global_autocmds = function ()
    -- Set linewidth to existing using `gq`
    -- Find better place
    vim.cmd([[autocmd! FileType tex set textwidth=96]])

    vim.cmd("syntax enable") -- Enable Syntax
    vim.opt.isfname:append({'=','{','}'})
    vim.cmd("au BufEnter,BufNewFile,BufAdd *.vim,*.lua set includeexpr=v:lua.LuaIncludeExpr(v:fname)")

    vim.cmd [[
    augroup vimrc_autocommands
    autocmd!

    " Specify some maps for filenames to filetypes
    autocmd BufNewFile,BufRead *pylintrc set filetype=cfg

    " Only use cursorline for current window, except when in diff mode
    autocmd WinEnter,FocusGained * if !&diff | setlocal cursorline | endif
    autocmd WinLeave,FocusLost   * if !&diff | setlocal nocursorline | endif
    " autocmd OptionSet diff call personal#init#toggle_diff()

    " When editing a file, always jump to the last known cursor position.
    " autocmd BufReadPost * call personal#init#go_to_last_known_position()

    " Set keymapping for command window
    autocmd CmdwinEnter * nnoremap <buffer> q     <c-c><c-c>
    autocmd CmdwinEnter * nnoremap <buffer> <c-f> <c-c>

    " Close preview after complete
    autocmd CompleteDone * if pumvisible() == 0 | silent! pclose | endif
    autocmd FileType help nnoremap <silent> q :bd<CR>
    autocmd FileType vimcmake nnoremap <silent> q :q<CR>
    autocmd FileType fzf nmap <silent> q a<C-c>
    autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
    augroup END
    ]]
end

local telescope_autocmds = function ()
  vim.api.nvim_command("autocmd FileType TelescopePrompt imap <buffer> <esc> <c-c>")
end

local fugitive_autocmds = function ()
  vim.cmd [[
  augroup vimrc_fugitive
  autocmd!
  autocmd WinEnter index call fugitive#ReloadStatus(-1, 0)
  autocmd BufReadPost fugitive:// setlocal bufhidden=delete
  autocmd FileType git setlocal foldlevel=1
  autocmd FileType git,fugitive nnoremap <buffer><silent> q :bwipeout!<cr>
  autocmd FileType fugitive
  \ nnoremap <buffer><silent> <f5> :call fugitive#ReloadStatus(-1, 0)<cr>
  augroup END
  ]]
end

local coc_cmds = function ()
    -- " Highlight the symbol and its references when holding the cursor.
    vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

    -- " Update signature help on jump placeholder.
    -- autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    vim.cmd("autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')")

    --   " Add `:Format` command to format current buffer.
    --   command! -nargs=0 Format :call CocAction('format')
    vim.cmd("command! -nargs=0 Format :call CocAction('format')")

    --   " Add `:Fold` command to fold current buffer.
    --   command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    vim.cmd("command! -nargs=? Fold :call     CocAction('fold', <f-args>)")

    --   " Add `:OR` command for organize imports of the current buffer.
    --   command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    vim.cmd("command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')")

end

local lsp_autocmds = function ()
    _G.get_capabilities = function ()
        for _,client in ipairs(vim.lsp.buf_get_clients()) do
            print(vim.inspect(client.resolved_capabilities))
        end
    end
    vim.cmd([[command! -nargs=0 LspCapabilities :call v:lua.get_capabilities()]])
end

return {
    global_autocmds = global_autocmds,
    telescope_autocmds = telescope_autocmds,
    fugitive_autocmds = fugitive_autocmds,
    lsp_autocmds = lsp_autocmds,
    coc_cmds = coc_cmds
}
