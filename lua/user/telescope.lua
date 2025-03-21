local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-k>"] = actions.move_selection_next,
        ["<C-j>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        -- ["<CR>"] = actions.select_default,
        -- ["<C-t>"] = actions.select_tab,
        ["<S-CR>"] = actions.select_default,
        ["<CR>"] = actions.select_tab,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-i>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
      mappings = {
        i = {
          ["<CR>"] = function(prompt_bufnr)
            local scheme = actions_state.get_selected_entry(prompt_bufnr)[1]
            require("user.colorschemes.schemepicker").setScheme(scheme)
            actions.close(prompt_bufnr)
            vim.cmd("colorscheme "..scheme)
          end
        },
        n = {
          ["<CR>"] = function(prompt_bufnr)
            local scheme = actions_state.get_selected_entry(prompt_bufnr)[1]
            require("user.colorschemes.schemepicker").setScheme(scheme)
            actions.close(prompt_bufnr)
            vim.cmd("colorscheme "..scheme)
          end
        }
      }
    }
  },
  extensions = {
    media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
      }
  },
}
