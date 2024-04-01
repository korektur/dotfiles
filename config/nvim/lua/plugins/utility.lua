return {
  {
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  },
  {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  },
  {
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    config = function()
      -- Setup nvim-cmp.
      local npairs = require("nvim-autopairs")

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function() end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      local ufo = require("ufo")

      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99 -- feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" > %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      ufo.setup({
        fold_virt_text_handler = handler,
        --[[ provider_selector = function(bufnr, filetype) ]]
        --[[   return { "treesitter", "indent" } ]]
        --[[ end ]]
      })
    end,
  },
  {
    "kylechui/nvim-surround", -- Surround
    config = function()
      local surround = require("nvim-surround")

      surround.setup({
        keymaps = {
          -- vim-surround style keymaps
          insert = "<C-g>s",
          normal = "ys",
          visual = "S",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
        },
        aliases = {
          ["a"] = ">", -- Single character aliases apply everywhere
          ["b"] = ")",
          ["B"] = "}",
          ["r"] = "]",
          ["q"] = { '"', "'", "`" }, -- Table aliases only apply for changes/deletions
        },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim", -- terminal
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        size = 10,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "single",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      local node = Terminal:new({ cmd = "node", hidden = true })

      function _NODE_TOGGLE()
        node:toggle()
      end

      local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

      function _NCDU_TOGGLE()
        ncdu:toggle()
      end

      local htop = Terminal:new({ cmd = "htop", hidden = true })

      function _HTOP_TOGGLE()
        htop:toggle()
      end

      local python = Terminal:new({ cmd = "python", hidden = true })

      function _PYTHON_TOGGLE()
        python:toggle()
      end

      local glow = {
        term = nil,
        id = nil,
      }
      glow.term = Terminal:new({
        hidden = true,
        float_opts = { border = "double" },
        on_exit = function(_)
          glow.id = nil
        end,
      })
      function _GLOW_TOGGLE()
        local file = vim.fn.expand("%")
        glow.term:toggle()
        glow.term:send("glow " .. file .. " -p")
        glow.id = glow.term.job_id
      end
    end,
  },
}
