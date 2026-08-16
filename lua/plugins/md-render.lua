return {
  "delphinus/md-render.nvim",
  version = "*",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", version = "*" }, -- optional
    { "delphinus/budoux.lua", version = "*" }, -- optional
  },
  keys = {
    { "<leader>mp", "<Plug>(md-render-preview)", desc = "Markdown preview (toggle)" },
    { "<leader>mt", "<Plug>(md-render-preview-tab)", desc = "Markdown preview in tab (toggle)" },
    { "<leader>md", "<Plug>(md-render-demo)", desc = "Markdown render demo" },
  },
  config = function()
    -- ponytail: md-render.nvim writes raw Kitty graphics APC sequences via
    -- nvim_ui_send with no tmux awareness, so tmux swallows them even with
    -- allow-passthrough on. Wrap only the graphics chunks (contain \x1b_G)
    -- in tmux's DCS passthrough envelope; cursor-move writes are left alone
    -- so tmux still translates them to the pane's real screen position.
    -- Ceiling: assumes the pane isn't obscured by other splits/panes: no
    -- clipping against neighboring panes. Fix upstream if that matters.
    if vim.env.TMUX then
      local orig_ui_send = vim.api.nvim_ui_send
      vim.api.nvim_ui_send = function(data)
        if data:find("\x1b_G", 1, true) then
          data = "\x1bPtmux;" .. data:gsub("\x1b", "\x1b\x1b") .. "\x1b\\"
        end
        orig_ui_send(data)
      end
    end
  end,
}
