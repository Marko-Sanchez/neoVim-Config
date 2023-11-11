require("nvim-treesitter.install").prefer_git = true

require'nvim-treesitter.configs'.setup {
  prefer_git = true,
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "go",
    "lua",
    "python",
    "vim",
    "yaml",
    "json",
  },
  disable = function(lang, buf)
    local max_filesize = 100 * 1024 -- 100kb
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
