vim.cmd [[
  aunmenu PopUp
  anoremenu PopUp.Inspect     <cmd>Inspect<CR>
  amenu PopUp.-1-             <NOP>
  anoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
  anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
  nnoremenu PopUp.Back        <C-t>
  amenu PopUp.-2-             <NOP>
  amenu     PopUp.URL         gx
]]

local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
  pattern = "*",
  group = group,
  desc = "Custom PopUp Setup",
  callback = function()
    vim.cmd [[
      amenu disable PopUp.Definition
      amenu disable PopUp.References
      amenu disable PopUp.URL
    ]]

    if vim.lsp.get_clients({ bufnr = 0 })[1] then
      vim.cmd [[
        amenu enable PopUp.Definition
        amenu enable PopUp.References
      ]]
    end

    local function is_url(text)
      -- URL pattern that matches http/https/ftp
      local pattern = "^https?://[%w-_%.%?%.:/%+=&%%@]+$"
      return text:match(pattern) ~= nil
    end

    -- Get the text under cursor within the current line
    local function get_text_under_cursor()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]

      -- Find word boundaries around cursor
      local start_pos = col
      while start_pos > 0 and line:sub(start_pos, start_pos):match("[%w%-%._~:/%?#%[%]@!%$&'%(%)%*%+,;=%%]") do
        start_pos = start_pos - 1
      end

      local end_pos = col
      while end_pos <= #line and line:sub(end_pos, end_pos):match("[%w%-%._~:/%?#%[%]@!%$&'%(%)%*%+,;=%%]") do
        end_pos = end_pos + 1
      end

      return line:sub(start_pos + 1, end_pos - 1)
    end

    local text = get_text_under_cursor()
    if is_url(text) then
      vim.cmd [[amenu enable PopUp.URL]]
    end
  end,
})
-- TODO: Add autocoommand
