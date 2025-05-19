return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    local function short_mode()
      local m = vim.fn.mode()
      return ({
        n = 'NOR',
        i = 'INS',
        v = 'VIS',
        V = 'V-L',
        [''] = 'V-B',
        c = 'CMD',
        R = 'REP',
      })[m] or m
    end

    local function selection_info()
      if vim.fn.mode():match('[vV]') then
        return 'sel'
      end
      return ''
    end

    local custom_theme = {
      normal = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
        b = { bg = '#2e2e3e', fg = '#ffffff' },
        c = { bg = '#2e2e3e', fg = '#ffffff' },
      },
      insert = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
      },
      visual = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
      },
      replace = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
      },
      command = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
      },
      inactive = {
        a = { bg = '#2e2e3e', fg = '#ffffff' },
        b = { bg = '#2e2e3e', fg = '#ffffff' },
        c = { bg = '#2e2e3e', fg = '#ffffff' },
      },
    }

    require('lualine').setup {
      options = {
        theme = custom_theme,
        section_separators = '',
        component_separators = '',
        globalstatus = false,
        icons_enabled = false,
      },
      sections = {
        lualine_a = {
          { short_mode }
        },
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1
          }
        },
        lualine_x = {},
        lualine_y = {
          { selection_info }
        },
        lualine_z = {
          'location'
        },
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = {},
        lualine_x = {}, lualine_y = {}, lualine_z = {}
      },
    }
  end,
}
