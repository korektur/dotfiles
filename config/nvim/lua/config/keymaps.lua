-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Shorten function name
local keymap = vim.keymap.set

-- cmake
keymap("n", "<leader>Cc", "<cmd>CMakeGenerate<CR>", { desc = "Generate" })
keymap("n", "<leader>Cb", "<cmd>CMakeBuild<CR>", { desc = "Build" })
keymap("n", "<leader>Cx", "<cmd>CMakeRun<CR>", { desc = "Run" })
keymap("n", "<leader>Cd", "<cmd>CMakeDebug<CR>", { desc = "Debug" })
keymap("n", "<leader>Ct", "<cmd>CMakeSelectBuildType<CR>", { desc = "Select Build Type" })
keymap("n", "<leader>Cu", "<cmd>CMakeSelectBuildTarget<CR>", { desc = "Select Build Target" })
keymap("n", "<leader>Cl", "<cmd>CMakeSelectLaunchTarget<CR>", { desc = "Select Launch Target" })
keymap("n", "<leader>Ceo", "<cmd>CMakeOpenExecutor<CR>", { desc = "Open CMake Executor" })
keymap("n", "<leader>Cec", "<cmd>CMakeCloseExecutor<CR>", { desc = "Close CMake Executor" })
keymap("n", "<leader>Cro", "<cmd>CMakeOpenRunner<CR>", { desc = "Open CMake Runner" })
keymap("n", "<leader>Crc", "<cmd>CMakeCloseRunner<CR>", { desc = "Close CMake Runner" })
keymap("n", "<leader>Ci", "<cmd>CMakeInstall<CR>", { desc = "Intall CMake target" })
keymap("n", "<leader>Cn", "<cmd>CMakeClean<CR>", { desc = "Clean CMake target" })
keymap("n", "<leader>Cs", function()
  vim.cmd([[CMakeStopRunner]])
  vim.cmd([[CMakeStopExecutor]])
end, { desc = "Stop CMake Process" })
