-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')
-- vim.wo.number = true
-- vim.wo.relativenumber = true
-- vim.opt.mouse = 'a'

if vim.g.vscode then
-- vscode specific settings
else
    -- terminal extensions
end

vim.filetype.add({
    extension = {
        tmpl = 'gotmpl',
        html = function(path, bufnr)
            -- Check if the file contains go template patterns
            local line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
            if line and line:match('{{.*}}') then return 'gotmpl' end
            return 'html'
        end,
    },
})
