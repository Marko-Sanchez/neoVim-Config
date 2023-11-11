vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_lists = {
    { type = 'sessions',  header = {'   Sessions'} },
    { type = 'files',     header = {'   Files'} },
    { type = 'dir',       header = {'   Current Directory ' .. vim.fn.getcwd()} },
    { type = 'bookmarks', header = {'   Bookmarks'} },
}
