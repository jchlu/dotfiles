return {
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
    config = function()
        require('Comment').setup()
        local ft = require('Comment.ft')
        ft.set('astro', { '<!--%s-->', '<!--%s-->' })
    end,
}
