local eol = require("inlay-hints.render.eol")
local virtline = require("inlay-hints.render.virtline")

local M = {}

local function clear_ns(ns, bufnr)
  -- clear namespace which clears the virtual text as well
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
end

function M.render(bufnr, ns, hints)
  clear_ns(ns, bufnr)

  for line, line_hints in pairs(hints) do
    if #line_hints > 1 then
      virtline.render_line(line, line_hints, bufnr, ns)
    else
      eol.render_line(line, line_hints, bufnr, ns)
    end
  end
end

return M