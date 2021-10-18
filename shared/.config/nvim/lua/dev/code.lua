local util = require('util')

require('Comment').setup({
    ignore = '^$'
})

require('pears').setup(
    function(conf)
        conf.expand_on_enter(true)
    end
)

require('surround').setup({
    mappings_style = "surround"
})


-- TODO: dispatch

