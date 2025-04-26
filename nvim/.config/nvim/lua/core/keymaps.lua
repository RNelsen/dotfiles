vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
<<<<<<< HEAD

--Debugging
-- vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🔵", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Debugger Continue" })
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Debugger Step Over" })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Debugger Step Into" })
vim.keymap.set("n", "<F23>", ":lua require'dap'.step_out()<CR>", { desc = "Debugger Step Out" })
vim.keymap.set("n", "<F17>", ":lua require'dap'.terminate()<CR>", { desc = "Debugger Stop" })
-- vim.keymap.set('n', '<leader><F5>', ":lua require'dap'.terminate()<CR>", { desc = 'Debugger Stop' })
-- vim.keymap.set('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Toggle Breakpoint' })
vim.keymap.set(
  "n",
  "<leader>b",
  ":lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
  { desc = "Toggle Breakpoint" }
)
-- vim.keymap.set('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", { desc = 'Breakpoint Condition' })
vim.keymap.set(
  "n",
  "<leader>B",
  ":lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
  { desc = "Breakpoint Condition" }
)
vim.keymap.set(
  "n",
  "<leader>BB",
  ":lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
  { desc = "Clear all breakpoints" }
)
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", { desc = "Restart debugger" })
vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Open Dap UI" })
vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>", { desc = "Close Dap UI" })
vim.keymap.set("n", "<leader>p", "<cmd>Precognition peek<CR>", { desc = "precognition toggle" })
