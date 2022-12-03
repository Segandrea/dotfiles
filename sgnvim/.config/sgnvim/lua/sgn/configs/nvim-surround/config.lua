return {
  keymaps = {
    insert = nil,
    insert_line = nil,
    normal = "<leader>s",      -- surround a textobject
    normal_cur = "<leader>sl", -- surround all the line
    normal_line = nil,         -- surround a textobject placing it in a line
    normal_cur_line = nil,     -- surround all the line placing it in a line
    visual = "<leader>s",      -- surround visual
    visual_line = nil,         -- surround visual placing it in a line
    delete = "<leader>sd",     -- delete surrounding
    change = "<leader>sc",     -- change surrounding
  },
}
