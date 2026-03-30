local M = {}

-- Simple ASCII intro that shows on startup
local function show_welcome()
  local ascii_art = [[

   ██████╗ ██████╗ ███████╗
  ██╔═══██╗██╔══██╗██╔════╝
  ██║   ██║██████╔╝███████╗
  ██║   ██║██╔══██╗╚════██║
  ╚██████╔╝██║  ██║███████║
   ╚═════╝ ╚═╝  ╚═╝╚══════╝

  ]]
  print(ascii_art)
  print("Neovim configuration loaded successfully.")
  print("")
end

-- Show welcome message after Neovim fully loads
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(show_welcome)
  end,
  once = true
})

return M
