local fn = function (name)
    print("YES LUA FUNCTION")
    return vim.fn.system('ls '..name)
end

return fn
