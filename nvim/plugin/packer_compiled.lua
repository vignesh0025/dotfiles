-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vignesh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vignesh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vignesh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vignesh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vignesh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ColorChange = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/ColorChange",
    url = "/home/vignesh/.config/nvim/plugins/ColorChange"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/incsearch.vim",
    url = "https://github.com/haya14busa/incsearch.vim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/jellybeans.vim",
    url = "https://github.com/nanotech/jellybeans.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    after = { "ColorChange", "tabline.nvim" },
    loaded = true,
    only_config = true
  },
  neoformat = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim‡\4\1\0\v\0\30\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0009\6\4\1B\6\1\2=\6\6\5=\5\b\0045\5\n\0003\6\t\0=\6\v\5=\5\f\0046\5\0\0'\a\r\0B\5\2\0029\5\14\5\18\a\0\0B\5\2\2=\5\15\0049\5\16\0009\5\17\0054\a\3\0005\b\18\0>\b\1\a5\b\19\0>\b\2\a4\b\3\0005\t\20\0>\t\1\b5\t\21\0>\t\2\bB\5\3\2=\5\17\4B\2\2\0019\2\3\0009\2\22\2'\4\23\0005\5\25\0004\6\3\0005\a\24\0>\a\1\6=\6\17\5B\2\3\0019\2\3\0009\2\22\2'\4\26\0005\5\29\0009\6\16\0009\6\17\0064\b\3\0005\t\27\0>\t\1\b4\t\3\0005\n\28\0>\n\1\tB\6\3\2=\6\17\5B\2\3\1K\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\14ultisnips\1\0\1\tname\rnvim_lsp\fsources\vconfig\fmapping\21nvim_cmp_keymaps\15vd.keymaps\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\15cmp_format\nsetup\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_option\bapi\bvim—\16\1\2\v\0007\0•\0013\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0009\5\5\0\a\5\6\0X\5\6€\18\5\2\0'\a\a\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a \0'\b\30\0'\t!\0005\n\"\0B\5\5\1\18\5\2\0'\a#\0'\b\30\0'\t!\0005\n$\0B\5\5\1\18\5\2\0'\a\a\0'\b%\0'\t&\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b'\0'\t(\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b)\0'\t*\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b+\0'\t,\0\18\n\4\0B\5\5\0019\5-\0009\5.\5\15\0\5\0X\6\a€\18\5\2\0'\a\a\0'\b/\0'\t0\0\18\n\4\0B\5\5\1X\5\n€9\5-\0009\0051\5\15\0\5\0X\6\6€\18\5\2\0'\a \0'\b/\0'\t2\0\18\n\4\0B\5\5\0019\5-\0009\0053\5\15\0\5\0X\6\4€6\0054\0009\0055\5'\a6\0B\5\2\0012\0\0€K\0\1\0Ð\2            augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n            augroup END\n            \bcmd\bvim\23document_highlight0<cmd>lua vim.lsp.buf.range_formatting()<CR>\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>=\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e\1\0\1\fnoremap\2\6x\1\0\1\fnoremap\0021<cmd>lua vim.lsp.buf.range_code_action()<CR>\6v+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>f&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD&<cmd>ClangdSwitchSourceHeader<CR>\t<F4>\6n\vclangd\tname\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0Ò\2\0\6\22\1\19\0013-\6\0\0\18\b\0\0\18\t\1\0\18\n\2\0\18\v\3\0\18\f\4\0\18\r\5\0B\6\a\0016\6\0\0009\6\1\0069\6\2\0069\6\3\6B\6\1\0024\a\0\0006\b\4\0\18\n\6\0B\b\2\4H\v\24€6\r\5\0\18\15\f\0B\r\2\4X\16\18€=\v\6\0179\18\b\0179\18\t\0189\18\n\18\22\18\0\18=\18\a\0179\18\b\0179\18\t\0189\18\f\18\22\18\0\18=\18\v\0179\18\14\17=\18\r\0176\18\15\0009\18\16\18\18\20\a\0\18\21\17\0B\18\3\1E\16\3\3R\16ìF\v\3\3R\væ6\b\0\0009\b\1\b9\b\17\b9\b\18\b\18\n\a\0B\b\2\1K\0\1\0\3À\15set_qflist\tutil\vinsert\ntable\fmessage\ttext\14character\bcol\tline\nstart\nrange\tlnum\nbufnr\vipairs\npairs\fget_all\15diagnostic\blsp\bvim\2³\5\1\1\14\2(\0O5\1\0\0-\2\0\0=\2\1\1-\2\1\0=\2\2\0019\2\3\0\a\2\4\0X\2\1€X\0020€9\2\3\0\a\2\5\0X\2\f€6\2\6\0009\2\a\2'\4\b\0\18\5\1\0005\6\f\0005\a\n\0005\b\t\0=\b\v\a=\a\r\6B\2\4\2\18\1\2\0X\2!€9\2\3\0\a\2\14\0X\2\30€6\2\6\0009\2\a\2'\4\b\0\18\5\1\0005\6\15\0-\a\0\0=\a\1\6-\a\1\0=\a\2\0065\a\29\0005\b\19\0005\t\17\0005\n\16\0=\n\18\t=\t\20\b5\t\24\0006\n\6\0009\n\21\n9\n\22\n'\f\23\0+\r\2\0B\n\3\2=\n\25\t=\t\26\b5\t\27\0=\t\28\b=\b\30\a=\a\31\6B\2\4\2\18\1\2\0\18\4\0\0009\2 \0\18\5\1\0B\2\3\1'\2!\0006\3\6\0009\3\"\0039\3#\0038\3\2\0036\4\6\0009\4\"\0049\4#\0043\5$\0<\5\2\0042\2\0€6\2%\0'\4&\0B\2\2\0029\2\1\0025\4'\0B\2\2\1K\0\1\0\1À\2À\1\0\1\20floating_window\1\18lsp_signature\frequire\0\rhandlers\blsp$textDocument/publishDiagnostics\nsetup\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\19default_config\1\0\0\17init_options\1\0\0\1\0\1\14arguments\28-header-insertion=never\nforce\15tbl_extend\bvim\vclangd\ncmake\tname\17capabilities\14on_attach\1\0\0ü\1\1\0\a\0\r\0\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0013\1\4\0006\2\0\0'\4\5\0B\2\2\0029\2\6\0026\4\a\0009\4\b\0049\4\t\0049\4\n\4B\4\1\0A\2\0\0023\3\v\0009\4\f\0\18\6\3\0B\4\2\0012\0\0€K\0\1\0\20on_server_ready\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\0\17lsp_autocmds\16vd.autocmds\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-toggle-terminal"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-toggle-terminal",
    url = "https://github.com/caenrique/nvim-toggle-terminal"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\2B\0\2\1K\0\1\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\1\0\1\27highlight_focused_file\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "playground" },
    loaded = true,
    only_config = true
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["qmake-syntax-vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/qmake-syntax-vim",
    url = "https://github.com/artoj/qmake-syntax-vim"
  },
  ["qt-support.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/qt-support.vim",
    url = "https://github.com/fedorenchik/qt-support.vim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  rainbow = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\15show_bufnr\2\nsetup\ftabline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/tabline.nvim",
    url = "https://github.com/kdheepak/tabline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\3\0\0\t\0\22\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\v\0=\4\f\3=\3\14\0025\3\15\0004\4\0\0=\4\16\3=\3\17\2B\0\2\0016\0\0\0'\2\18\0B\0\2\0029\0\19\0B\0\1\0016\0\0\0'\2\20\0B\0\2\0029\0\21\0B\0\1\1K\0\1\0\23telescope_autocmds\16vd.autocmds\22telescope_keymaps\15vd.keymaps\fpickers\17file_browser\1\0\0\rdefaults\1\0\0\25file_ignore_patterns\1\4\0\0\17node_modules\n%.out\fplugged\rmappings\1\0\1\18prompt_prefix\nðŸ” \6i\1\0\0\n<Esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/tmux-complete.vim",
    url = "https://github.com/wellle/tmux-complete.vim"
  },
  ultisnips = {
    config = { "\27LJ\2\nÌ\2\0\0\2\0\v\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\n\0K\0\1\0&UltiSnipsRemoveSelectModeMappings\15<c-x><c-s>\26UltiSnipsListSnippets$<Plug>(ultisnips_jump_backward)!UltiSnipsJumpBackwardTrigger#<Plug>(ultisnips_jump_forward) UltiSnipsJumpForwardTrigger\29<Plug>(ultisnips_expand)\27UltiSnipsExpandTrigger\6g\bvim\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  vim = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/dracula/vim"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://github.com/chiel92/vim-autoformat"
  },
  ["vim-cheat40"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-cheat40",
    url = "https://github.com/lifepillar/vim-cheat40"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-flake8"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-flake8",
    url = "https://github.com/nvie/vim-flake8"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nu\0\0\3\0\5\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\22fugitive_autocmds\16vd.autocmds\21fugitive_keymaps\15vd.keymaps\frequire\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-gotham"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-gotham",
    url = "https://github.com/whatyouhide/vim-gotham"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-polyglot"] = {
    config = { "\27LJ\2\nE\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\15autoindent\1\25polyglot_is_disabled\6g\bvim\0" },
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-prototxt"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-prototxt",
    url = "https://github.com/chiphogg/vim-prototxt"
  },
  ["vim-qml"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-qml",
    url = "https://github.com/peterhoeg/vim-qml"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-ripgrep",
    url = "https://github.com/jremmen/vim-ripgrep"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events",
    url = "https://github.com/tmux-plugins/vim-tmux-focus-events"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-tmux-runner"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-tmux-runner",
    url = "https://github.com/christoomey/vim-tmux-runner"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  vimspector = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  vimtex = {
    loaded = true,
    path = "/home/vignesh/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0,highlight NvimTreeFolderIcon guibg=blue\bcmd%nvim_tree_highlight_opened_files\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Config for: vim-polyglot
time([[Config for vim-polyglot]], true)
try_loadstring("\27LJ\2\nE\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\15autoindent\1\25polyglot_is_disabled\6g\bvim\0", "config", "vim-polyglot")
time([[Config for vim-polyglot]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\3=\3\6\2B\0\2\1K\0\1\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\1\0\1\27highlight_focused_file\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim‡\4\1\0\v\0\30\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0009\6\4\1B\6\1\2=\6\6\5=\5\b\0045\5\n\0003\6\t\0=\6\v\5=\5\f\0046\5\0\0'\a\r\0B\5\2\0029\5\14\5\18\a\0\0B\5\2\2=\5\15\0049\5\16\0009\5\17\0054\a\3\0005\b\18\0>\b\1\a5\b\19\0>\b\2\a4\b\3\0005\t\20\0>\t\1\b5\t\21\0>\t\2\bB\5\3\2=\5\17\4B\2\2\0019\2\3\0009\2\22\2'\4\23\0005\5\25\0004\6\3\0005\a\24\0>\a\1\6=\6\17\5B\2\3\0019\2\3\0009\2\22\2'\4\26\0005\5\29\0009\6\16\0009\6\17\0064\b\3\0005\t\27\0>\t\1\b4\t\3\0005\n\28\0>\n\1\tB\6\3\2=\6\17\5B\2\3\1K\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\14ultisnips\1\0\1\tname\rnvim_lsp\fsources\vconfig\fmapping\21nvim_cmp_keymaps\15vd.keymaps\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\15cmp_format\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\nÌ\2\0\0\2\0\v\0\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\n\0K\0\1\0&UltiSnipsRemoveSelectModeMappings\15<c-x><c-s>\26UltiSnipsListSnippets$<Plug>(ultisnips_jump_backward)!UltiSnipsJumpBackwardTrigger#<Plug>(ultisnips_jump_forward) UltiSnipsJumpForwardTrigger\29<Plug>(ultisnips_expand)\27UltiSnipsExpandTrigger\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\né\2\0\0\5\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0004\4\0\0=\4\a\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\17query_linter\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\21use_virtual_text\2\venable\2\14highlight\1\0\1\venable\2\vindent\1\0\1\venable\2\15playground\fdisable\1\0\3\15updatetime\3\25\20persist_queries\1\venable\2\21ensure_installed\1\0\0\1\a\0\0\6c\bcpp\vpython\blua\fverilog\ncmake\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\a6\0\0\0009\0\1\0009\0\2\0B\0\1\2:\0\1\0009\0\3\0L\0\2\0\tname\20buf_get_clients\blsp\bvimå\2\1\0\t\0\17\0.6\0\0\0009\0\1\0\v\0\0\0X\0\3€6\0\0\0003\1\2\0=\1\1\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\0026\1\6\0009\1\a\0019\3\b\0009\3\t\0036\4\0\0009\4\1\4B\1\3\2\14\0\1\0X\1\v€9\1\b\0006\2\6\0009\2\n\0024\4\3\0006\5\0\0009\5\1\5>\5\1\0049\5\b\0009\5\t\5B\2\3\2=\2\t\0016\1\3\0'\3\4\0B\1\2\0029\1\v\0016\3\6\0009\3\f\3'\5\r\0\18\6\0\0005\a\15\0005\b\14\0=\b\16\aB\3\4\0A\1\0\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\19solarized_dark\nforce\20tbl_deep_extend\nsetup\16list_extend\14lualine_x\rsections\17tbl_contains\bvim\15get_config\flualine\frequire\0\28get_current_lang_server\a_G\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nu\0\0\3\0\5\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\22fugitive_autocmds\16vd.autocmds\21fugitive_keymaps\15vd.keymaps\frequire\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_option\bapi\bvim—\16\1\2\v\0007\0•\0013\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0009\5\5\0\a\5\6\0X\5\6€\18\5\2\0'\a\a\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a \0'\b\30\0'\t!\0005\n\"\0B\5\5\1\18\5\2\0'\a#\0'\b\30\0'\t!\0005\n$\0B\5\5\1\18\5\2\0'\a\a\0'\b%\0'\t&\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b'\0'\t(\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b)\0'\t*\0\18\n\4\0B\5\5\1\18\5\2\0'\a\a\0'\b+\0'\t,\0\18\n\4\0B\5\5\0019\5-\0009\5.\5\15\0\5\0X\6\a€\18\5\2\0'\a\a\0'\b/\0'\t0\0\18\n\4\0B\5\5\1X\5\n€9\5-\0009\0051\5\15\0\5\0X\6\6€\18\5\2\0'\a \0'\b/\0'\t2\0\18\n\4\0B\5\5\0019\5-\0009\0053\5\15\0\5\0X\6\4€6\0054\0009\0055\5'\a6\0B\5\2\0012\0\0€K\0\1\0Ð\2            augroup lsp_document_highlight\n            autocmd!\n            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()\n            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n            augroup END\n            \bcmd\bvim\23document_highlight0<cmd>lua vim.lsp.buf.range_formatting()<CR>\30document_range_formatting*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>=\24document_formatting\26resolved_capabilities2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e\1\0\1\fnoremap\2\6x\1\0\1\fnoremap\0021<cmd>lua vim.lsp.buf.range_code_action()<CR>\6v+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>f&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\6K*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD&<cmd>ClangdSwitchSourceHeader<CR>\t<F4>\6n\vclangd\tname\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0Ò\2\0\6\22\1\19\0013-\6\0\0\18\b\0\0\18\t\1\0\18\n\2\0\18\v\3\0\18\f\4\0\18\r\5\0B\6\a\0016\6\0\0009\6\1\0069\6\2\0069\6\3\6B\6\1\0024\a\0\0006\b\4\0\18\n\6\0B\b\2\4H\v\24€6\r\5\0\18\15\f\0B\r\2\4X\16\18€=\v\6\0179\18\b\0179\18\t\0189\18\n\18\22\18\0\18=\18\a\0179\18\b\0179\18\t\0189\18\f\18\22\18\0\18=\18\v\0179\18\14\17=\18\r\0176\18\15\0009\18\16\18\18\20\a\0\18\21\17\0B\18\3\1E\16\3\3R\16ìF\v\3\3R\væ6\b\0\0009\b\1\b9\b\17\b9\b\18\b\18\n\a\0B\b\2\1K\0\1\0\3À\15set_qflist\tutil\vinsert\ntable\fmessage\ttext\14character\bcol\tline\nstart\nrange\tlnum\nbufnr\vipairs\npairs\fget_all\15diagnostic\blsp\bvim\2³\5\1\1\14\2(\0O5\1\0\0-\2\0\0=\2\1\1-\2\1\0=\2\2\0019\2\3\0\a\2\4\0X\2\1€X\0020€9\2\3\0\a\2\5\0X\2\f€6\2\6\0009\2\a\2'\4\b\0\18\5\1\0005\6\f\0005\a\n\0005\b\t\0=\b\v\a=\a\r\6B\2\4\2\18\1\2\0X\2!€9\2\3\0\a\2\14\0X\2\30€6\2\6\0009\2\a\2'\4\b\0\18\5\1\0005\6\15\0-\a\0\0=\a\1\6-\a\1\0=\a\2\0065\a\29\0005\b\19\0005\t\17\0005\n\16\0=\n\18\t=\t\20\b5\t\24\0006\n\6\0009\n\21\n9\n\22\n'\f\23\0+\r\2\0B\n\3\2=\n\25\t=\t\26\b5\t\27\0=\t\28\b=\b\30\a=\a\31\6B\2\4\2\18\1\2\0\18\4\0\0009\2 \0\18\5\1\0B\2\3\1'\2!\0006\3\6\0009\3\"\0039\3#\0038\3\2\0036\4\6\0009\4\"\0049\4#\0043\5$\0<\5\2\0042\2\0€6\2%\0'\4&\0B\2\2\0029\2\1\0025\4'\0B\2\2\1K\0\1\0\1À\2À\1\0\1\20floating_window\1\18lsp_signature\frequire\0\rhandlers\blsp$textDocument/publishDiagnostics\nsetup\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\19default_config\1\0\0\17init_options\1\0\0\1\0\1\14arguments\28-header-insertion=never\nforce\15tbl_extend\bvim\vclangd\ncmake\tname\17capabilities\14on_attach\1\0\0ü\1\1\0\a\0\r\0\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0013\1\4\0006\2\0\0'\4\5\0B\2\2\0029\2\6\0026\4\a\0009\4\b\0049\4\t\0049\4\n\4B\4\1\0A\2\0\0023\3\v\0009\4\f\0\18\6\3\0B\4\2\0012\0\0€K\0\1\0\20on_server_ready\0\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\0\17lsp_autocmds\16vd.autocmds\23nvim-lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\3\0\0\t\0\22\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\t\0005\4\a\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\5=\5\b\4=\4\n\0035\4\v\0=\4\f\3=\3\14\0025\3\15\0004\4\0\0=\4\16\3=\3\17\2B\0\2\0016\0\0\0'\2\18\0B\0\2\0029\0\19\0B\0\1\0016\0\0\0'\2\20\0B\0\2\0029\0\21\0B\0\1\1K\0\1\0\23telescope_autocmds\16vd.autocmds\22telescope_keymaps\15vd.keymaps\fpickers\17file_browser\1\0\0\rdefaults\1\0\0\25file_ignore_patterns\1\4\0\0\17node_modules\n%.out\fplugged\rmappings\1\0\1\18prompt_prefix\nðŸ” \6i\1\0\0\n<Esc>\1\0\0\nclose\22telescope.actions\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd tabline.nvim ]]

-- Config for: tabline.nvim
try_loadstring("\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\15show_bufnr\2\nsetup\ftabline\frequire\0", "config", "tabline.nvim")

vim.cmd [[ packadd ColorChange ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
