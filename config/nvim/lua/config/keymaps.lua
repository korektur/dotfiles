-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Toggle visibility of nvim tree

-- Shorten function name
local keymap = vim.keymap.set

keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "toggle neovim tree" })

-- Resize
keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical :resize -2<CR>", { silent = true, desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical :resize +2<CR>", { silent = true, desc = "Increase window width" })

-- cmake
keymap("n", "<leader>cc", "<cmd>CMakeGenerate<CR>", { desc = "Generate" })
keymap("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
keymap("n", "<leader>cx", "<cmd>CMakeRun<CR>", { desc = "Run" })
keymap("n", "<leader>cd", "<cmd>CMakeDebug<CR>", { desc = "Debug" })
keymap("n", "<leader>ct", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select Build Type" })
keymap("n", "<leader>cu", "<cmd>CMakeSelectBuildTarget<CR>", { desc = "Select Build Target" })
keymap("n", "<leader>cl", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select Launch Target" })
keymap("n", "<leader>ceo", "<cmd>CMakeOpenExecutor<CR>", { desc = "Open CMake Executor" })
keymap("n", "<leader>cec", "<cmd>CMakeCloseExecutor<CR>", { desc = "Close CMake Executor" })
keymap("n", "<leader>cro", "<cmd>CMakeOpenRunner<CR>", { desc = "Open CMake Runner" })
keymap("n", "<leader>crc", "<cmd>CMakeCloseRunner<CR>", { desc = "Close CMake Runner" })
keymap("n", "<leader>ci", "<cmd>CMakeInstall<CR>", { desc = "Intall CMake target" })
keymap("n", "<leader>cn", "<cmd>CMakeClean<CR>", { desc = "Clean CMake target" })
keymap("n", "<leader>cs", function()
  vim.cmd([[CMakeStopRunner]])
  vim.cmd([[CMakeStopExecutor]])
end, { desc = "Stop CMake Process" })
