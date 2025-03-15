-- Writes to file current_scheme.lua (which is loaded in init.lua) to persist
-- colorscheme selected via telescope beyond current / one session.
-- TODO: Adjust to use 'require ('name')' for colorscheme whom are customized in /colorscheme
local M = {}
local script_path = debug.getinfo(1, "S").source:sub(2):match("(.*[\\/])").."current_scheme.lua"

function M.setScheme(name)

    local color_scheme_file = io.open(script_path, "w")

    if not color_scheme_file then
        vim.print("Error: Could not open file")
        return
    end

    io.output(color_scheme_file)
    local output = "vim.cmd.colorscheme('"..name.."')"
    io.write(output)
    io.close(color_scheme_file)
end

return M
