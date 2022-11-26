--[[ FORMAT OPTIONS TABLE
/ : insert comment leader only if comment is at the start of the line
] : respect 'textwidth' rigorously
1 : don't break line after a one-letter word
2 : use indentation of the second line
B : when joining lines do not insert a <Space> between two multibyte characters [overruled by M]
M : when joining lines do not insert a <Space> before or after a multibyte char [overrules B]
a : auto-format paragraph (see `:help auto-format`)
b : auto break the line at a blank only if there is a blank before 'textwidth'
c : auto wrap comments using 'textwidth'
j : remove comment leader when joining lines
l : don't autoformat if line is already longer than 'textwidth'
m : useful for asian text
n : recognize and indent numbered list while formatting [requires 'autoindent']
o : auto insert comment leader after 'o' or 'O'
p : don't break line after a period '.'
q : format comments with 'gq'
r : auto insert comment leader after <Enter>
t : auto wrap text using 'textwidth'
v : auto break the line at a blank in insert mode
w : a trailing whitespace means paragraph continues in the next line
--]]
vim.bo.formatoptions = ']1bjnpt'
vim.o.autowriteall = true
vim.wo.number = false
vim.wo.relativenumber = false
vim.bo.textwidth = 80
vim.wo.colorcolumn = '80'
vim.wo.signcolumn = 'no'
vim.o.timeoutlen = 300
