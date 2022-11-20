Mapper = {}

Mapper.map = function(mappings)
  for _, binding in ipairs(mappings) do
    vim.keymap.set(
      binding.mode,
      binding.key,
      binding.act,
      {
        desc = binding.desc,
        expr = binding.expr,
        buffer = binding.bufnr,
        silent = binding.silent or true,
        noremap = binding.noremap or true,
      }
    )
  end
end


return Mapper
