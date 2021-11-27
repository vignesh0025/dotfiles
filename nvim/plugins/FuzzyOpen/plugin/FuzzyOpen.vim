fun! FuzzyLoad()
    " lua for k,v in pairs(package.loaded) do if k:match('FuzzyOpen') then package.loaded[k] = nil end end
    lua fuzzyload = require('FuzzyOpen')
    lua fuzzyload.create_floating_win()
endf

