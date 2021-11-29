-- Author: Vignesh D
-- Date:

local buffers = nil
local windows = nil
local current_highlighted_line = nil

local init = function ()
    print("Count: "..No)
    No = No + 1
end

local highlight_line_buf = function(line_no)
  vim.api.nvim_buf_clear_namespace(buffers["buf"], -1, 0, -1)
  vim.api.nvim_buf_add_highlight(buffers["buf"], 0, "Search", line_no or current_highlighted_line, 0, -1)
end

local function create_floating_win()
  parent_win= vim.api.nvim_get_current_win()

  buf = vim.api.nvim_create_buf(false, true)
  input_buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(input_buf, 'bufhidden', 'wipe')


  -- local win_height = vim.api.nvim_get_option('lines')
  -- local win_width = vim.api.nvim_get_option('columns')

  local win_height = vim.api.nvim_win_get_height(0)
  local win_width = vim.api.nvim_win_get_width(0)

  local height = math.ceil(win_height * 0.8)
  local width = math.ceil(win_width * 0.8)

  local col = math.ceil((win_width - width) / 2) - 4
  local row = math.ceil((win_height - height) / 2)

  local win_options = {
    relative='editor',
    width = width,
    height = height,
    style = "minimal",
    row = row,
    col = col,
    focusable = false
  }

  local input_win_options = {
    relative='editor',
    width = width,
    height = 2,
    style = "minimal",
    row = row-2,
    col = col,
  }

  -- Autocmds must be present before we open the windows for BufWinEnter to work I think
  vim.api.nvim_exec("autocmd! BufHidden,BufLeave <buffer="..input_buf.."> silent! :"..buf.."bw!<CR>", false)
  vim.api.nvim_exec("autocmd! TextChangedI <buffer="..input_buf.."> :lua fuzzyload.inputchanged()", false)

  win = vim.api.nvim_open_win(buf, false, win_options)
  input_win = vim.api.nvim_open_win(input_buf, true, input_win_options)
  vim.api.nvim_exec(":startinsert", false)

  windows =
  {
    ['parent_win'] = parent_win,
    ['win'] = win,
    ['input_win'] = input_win
  }

  buffers =
  {
    ['buf'] = buf,
    ['input_buf'] = input_buf
  }


  keymap_options = {['noremap'] = true, ['silent'] = true}
  vim.api.nvim_buf_set_keymap(input_buf, "i", "<ESC>", '<C-o>:lua fuzzyload.close_windows()<CR>',  keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "n", "<ESC>", ':lua fuzzyload.close_windows()<CR>',  keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "n", "q", ':lua fuzzyload.close_windows()<CR>',  keymap_options)

  vim.api.nvim_buf_set_keymap(input_buf, "n", "<CR>", ':lua fuzzyload.keypressed("enter")<CR>', keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "i", "<CR>", '<C-o>:lua fuzzyload.keypressed("enter")<CR>', keymap_options)

  vim.api.nvim_buf_set_keymap(input_buf, "n", "<Up>", ':lua fuzzyload.keypressed("up")<CR>', keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "n", "<Down>", ':lua fuzzyload.keypressed("down")<CR>', keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "i", "<Up>", '<C-o>:lua fuzzyload.keypressed("up")<CR>', keymap_options)
  vim.api.nvim_buf_set_keymap(input_buf, "i", "<Down>", '<C-o>:lua fuzzyload.keypressed("down")<CR>', keymap_options)

  local files = vim.fn.split(vim.fn.system("rg --files"), "\\n")
  line = string.rep("-", width)
  vim.api.nvim_buf_set_lines(input_buf, 1, -1, false, {line})
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, files)

  current_highlighted_line = 0
  highlight_line_buf()
end

local close_windows = function()
 vim.api.nvim_win_close(windows['win'], true)
 vim.api.nvim_win_close(windows['input_win'], true)
end

local inputchanged = function()
  local newdata = vim.fn.getline('.')
  local files = nil
  if #newdata == 0 then
    files = vim.fn.split(vim.fn.system("rg --files"), "\\n")
  else
    files = vim.fn.split(vim.fn.system("rg --files | rg "..newdata), "\\n")
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, files)

  current_highlighted_line = 0
  highlight_line_buf()
end

local function create_win()
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  win = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  buf = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(buf, 'Oldfiles #' .. buf)

  -- Now we set some options for our buffer.
  -- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
  -- Also some plugins treat nofile buffers different.
  -- For example coc.nvim don't triggers aoutcompletation for these.
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  -- We do not need swapfile.
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  -- And we would rather prefer that buffer will be destroyed when hide.
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  -- It's not necessary but it is good practice to set custom filetype.
  -- This allows users to create their own autocommand or colorschemes on filetype.
  -- and prevent collisions with other plugins.
  vim.api.nvim_buf_set_option(buf, 'filetype', 'nvim-oldfile')

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(win, 'wrap', false)
  vim.api.nvim_win_set_option(win, 'cursorline', true)


  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':bd!<CR>', {['noremap'] = true})
  -- set_mappings() -- At end we will set mappings for our navigation.
end

-- It's our main starting function. For now we will only creating navigation window here.
local oldfiles =  function ()
  create_win()
end

local clamp = function(max, value)
  value = math.fmod(value, max)
  if value < 0 then
    value = value + max
  end
  return value
end

local keypressed = function(key)
  local no_of_lines = vim.api.nvim_buf_get_lines(buffers["buf"], 0, -1, true)
  if key == "up" then
    current_highlighted_line = (current_highlighted_line - 1)
    current_highlighted_line = clamp(#no_of_lines, current_highlighted_line)
    highlight_line_buf()
  elseif key == "down" then
    current_highlighted_line = current_highlighted_line + 1
    current_highlighted_line = clamp(#no_of_lines, current_highlighted_line)
    highlight_line_buf()
  elseif key == "enter" then
    -- Lua index starts with fucking 0
    file = no_of_lines[current_highlighted_line + 1]
    close_windows()
    vim.api.nvim_exec(':e '..file, false)
  end
end

return {
    init = init,
    oldfiles = oldfiles,
    create_floating_win = create_floating_win,
    inputchanged = inputchanged,
    close_windows = close_windows,
    keypressed = keypressed,
}
