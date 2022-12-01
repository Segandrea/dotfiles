local config = {}
-- configuration for mason
config.mason = {
  ui = {
    border = 'rounded',
    -- requires nerdfonts
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    }
  }
}

-- configuration for lsp-zero preferences
config.zero_preferences = {
  set_lsp_keymaps = false, -- modified
  manage_nvim_cmp = false, -- modified
  sign_icons = {
    -- requires nerd fonts, matches trouble.nvim
    error = '',
    warn = '',
    hint = '',
    info = '',
  }
}

-- configuration for diagnostic
config.diagnostic = {
  virtual_text = { prefix = '' },
}

return config
