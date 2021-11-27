lua << EOF
    -- for k in pairs(package.loaded) do
    --   if k:match('vd%-plugin') then
    --     package.loaded[k] = nil
    --   end
    -- end

    a = require("vd-plugin")
    a.set_init_theme()
EOF

function! ChangeTheme(arg) abort
  " The below line is required for development
  "lua
  call v:lua.a.changetheme(a:arg)
endfunction

function! Check() abort
  lua for k in pairs(package.loaded) do if k:match('vd%-plugin') then package.loaded[k] = nil end end
endfunction

nnoremap <Plug>(ForwardTheme) :call ChangeTheme(v:true)<CR>
nnoremap <Plug>(BackwardTheme) :call ChangeTheme(v:false)<CR>

" NOTE: USE nmap when using Plug so, it gets remaped to actual function
nmap <silent> <F5> <Plug>(ForwardTheme)
nmap <silent> <S-F5> <Plug>(BackwardTheme)
