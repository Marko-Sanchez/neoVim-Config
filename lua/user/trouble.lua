local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  return
end

require'nvim-web-devicons'.get_icons()

trouble.setup({
    modes = {
        mydiagnostics = {
            mode = "diagnostics",
            focus = true,
            filter = {buf = 0},
            preview = {
                type = "split",
                relative = "win",
                position = "right",
                size = 0.4,
            },
        },
    }
})
