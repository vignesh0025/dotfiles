local set_color_scheme = function (name, background, airline)
    -- [[
    -- This the below statement are set twice before and after setting colorscheme to fix an
    -- issue of nord colorscheme for airline not working before settings colorscheme. Whereas
    -- some themes affect colorscheme themself
    -- ]]
    vim.api.nvim_exec(string.format([[
        set background=%s
        colorscheme %s
    ]], background, name), false)

    if _G.packer_plugins["lualine.nvim"] and _G.packer_plugins["lualine.nvim"].loaded then
        -- other custom logic
        local line = require('lualine')
        local config = line.get_config()
        config.options.theme = airline
        line.setup(config)
    end

    -- vim.api.nvim_set_var("airline_theme", airline)
    -- or vim.g.airline_theme = airline

    -- vim.api.nvim_exec(string.format([[
    --     set background=%s
    --     colorscheme %s
    -- ]], background, name), false)
end

local select_scheme = {
        [0] = function() set_color_scheme("gruvbox-material", "dark", "gruvbox-material") end,
        [1] = function() set_color_scheme("PaperColor", "light", "PaperColor") end,
        [2] = function() set_color_scheme("PaperColor", "dark", "PaperColor") end,
        [3] = function() set_color_scheme("gotham256", "dark", "PaperColor") end,
        [4] = function() set_color_scheme("jellybeans", "dark", "jellybeans") end,
        [5] = function() set_color_scheme("nord", "dark", "nord") end,
        [6] = function() set_color_scheme("ayu", "dark", "ayu") end,
        [7] = function() set_color_scheme("dracula", "dark", "dracula") end
}

local config_file = "/home/vignesh/.config/nvim/set.json"


local lsettings_write = function(data)
    local file = vim.loop.fs_open(config_file,"w",438)
    local json_data = vim.fn.json_encode({color_no = data})
    vim.loop.fs_write(file, json_data)
    vim.loop.fs_close(file)
end

local lsettings_write_async = function(data)
    local json_data = vim.fn.json_encode({color_no = data})
    local file = vim.loop.fs_open(config_file,"w",438, function (err, file)
        if err then
            print(err)
            return
        end
        vim.loop.fs_write(file, json_data)
    end)
end


local lsettings_read = function()
    local file = vim.loop.fs_open(config_file,"r",438)

    if file == nil then
        lsettings_write(0)
        file = vim.loop.fs_open(config_file,"r",438)
    end
    local stat = vim.loop.fs_stat(config_file)
    local data = vim.loop.fs_read(file, stat.size)
    vim.loop.fs_close(file)
    return vim.fn.json_decode(data)
end

local lsettings_read_async = function(fn_data)
    vim.loop.fs_open(config_file,"r",438, function (err, file)
        if err then
            print(err)
            return
        end

        if file == nil then
            lsettings_write_async(0)
            fn_data({["color_no"] = 0})
        else
            local stat = vim.loop.fs_stat(config_file)
            local data = vim.loop.fs_read(file, stat.size)
            -- This vim.schedule and vim.schedule_wrap is required
            -- when we are calling a vim.fn inside a loop callback
            vim.schedule(function()
                fn_data(vim.fn.json_decode(data))
            end)
        end
    end)
end


local lchangetheme = function (arg)
    if (arg == nil or arg == true) then
        vim.g.color_no = vim.g.color_no + 1
        if vim.g.color_no > #select_scheme then vim.g.color_no = 0 end
    else
        vim.g.color_no = vim.g.color_no - 1
        if vim.g.color_no < 0 then vim.g.color_no = #select_scheme end
    end
    -- current_color_scheme = vim.api.nvim_exec("colorscheme", true)
    select_scheme[vim.g.color_no]()
    lsettings_write(vim.g.color_no)
    return vim.g.color_no
end

local lset_init_theme = function()
    if vim.g.color_no == nil then
        lsettings_read_async(function (data)
            vim.g.color_no = data["color_no"]
            select_scheme[vim.g.color_no]()
        end)
        -- vim.g.color_no = lsettings_read()["color_no"]
        -- select_scheme[vim.g.color_no]()
    end
end

return {
    changetheme = lchangetheme,
    set_init_theme = lset_init_theme
}
