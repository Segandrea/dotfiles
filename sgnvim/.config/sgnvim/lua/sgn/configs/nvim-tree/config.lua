return {
  reload_on_bufenter = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        git = {
          untracked = '',
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = '',
      info = '',
      warning = "",
      error = '',
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  -- required to work with project.nvim --
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
}
