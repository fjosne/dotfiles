-- Remove info line below statusline
vim.cmd('set nosmd')

-- Legend:
-- | A | B | C            X | Y | Z |
require('lualine').setup({
    options = {
        -- theme = 'gruvbox',
        component_separators = {'', ''},
        section_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'filename',
            {
                'diagnostics',
                sources = {'nvim_lsp'},
                sections = {'error', 'warn', 'info', 'hint'},
                symbols = {error = 'E: ', warn = 'W: ', info = 'I: ', hint = 'H: '}

            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            'branch',
            'diff'
        },
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {'filetype'},
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
})

-- local gl = require('galaxyline')
-- local colors = require('colors').gruvbox_dark
-- local condition = require('galaxyline.condition')
-- local gls = gl.section
-- gl.short_line_list = {'NvimTree','vista','dbui','packer'}

-- local my_icons = require('galaxyline.provider_fileinfo').define_file_icon()

-- gls.left[1] = {
--   RainbowRed = {
--     provider = function() return ' ' end,
--     highlight = {colors.cyan,colors.bg}
--   },
-- }
-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_color = {n = colors.green, i = colors.cyan,v=colors.orange,
--                           [''] = colors.orange,V=colors.orange,
--                           c = colors.magenta,no = colors.red,s = colors.orange,
--                           S=colors.orange,[''] = colors.orange,
--                           ic = colors.yellow,R = colors.red,Rv = colors.violet,
--                           cv = colors.red,ce=colors.red, r = colors.cyan,
--                           rm = colors.cyan, ['r?'] = colors.cyan,
--                           ['!']  = colors.red,t = colors.red}
--       vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
--       local mode_symbols = {
--             n = 'NORMAL',
--             i = 'INSERT',
--             v = 'VISUAL',
--             V = 'VISUAL',
--             [''] = 'VISUAL' ,
--             c = 'CMD',
--             R = 'REPLACE'
--         }
--       return mode_symbols[vim.fn.mode()]
--     end,
--     separator = ' ',
--     -- { foreground color, background color, gui (underline, undercurl, inverse, bold,...)}
--     highlight = {colors.red,colors.bg,'bold'},
--   },
-- }

-- gls.left[3] = {
--   FileSize = {
--     provider = 'FileSize',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fgalt,colors.bg}
--   }
-- }
-- gls.left[4] ={
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = condition.buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
--   },
-- }

-- gls.left[5] = {
--   FileName = {
--     provider = 'FileName',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.magenta,colors.bg,'bold'}
--   }
-- }

-- gls.left[6] = {
--   LineInfo = {
--     provider = 'LineColumn',
--     separator = ' ',
--     separator_highlight = {'asdfsadf',colors.bg},
--     highlight = {colors.fg,colors.bg},
--   },
-- }

-- gls.left[7] = {
--   PerCent = {
--     provider = 'LinePercent',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.fg,colors.bg,'bold'},
--   }
-- }

-- gls.left[8] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     -- icon = '  ',
--     icon = '  ',
--     highlight = {colors.red,colors.bg}
--   }
-- }
-- gls.left[9] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.orange,colors.bg},
--   }
-- }

-- gls.left[10] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     -- icon = '  ',
--     icon = '  ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }

-- gls.left[11] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     -- icon = '  ',
--     icon = '  ',
--     highlight = {colors.cyan,colors.bg},
--   }
-- }

-- --[[ gls.mid[0] = {
-- } ]]

-- --[[ gls.right[0] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function ()
--       local tbl = {['dashboard'] = true,['']=true}
--       if tbl[vim.bo.filetype] then
--         return false
--       end
--       return true
--     end,
--     icon = '? LSP:',
--     highlight = {colors.cyan,colors.bg,'bold'}
--   }
-- } ]]

-- --[[ gls.right[1] = {
--   FileEncode = {
--     provider = 'FileEncode',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- } ]]

-- --[[ gls.right[2] = {
--   FileFormat = {
--     provider = 'FileFormat',
--     condition = condition.hide_in_width,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.green,colors.bg,'bold'}
--   }
-- }
--  ]]
-- gls.right[3] = {
--   GitIcon = {
--     provider = function() return '  ' end,
--     condition = condition.check_git_workspace,
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

-- gls.right[4] = {
--   GitBranch = {
--     provider = 'GitBranch',
--     condition = condition.check_git_workspace,
--     icon = ' ',
--     highlight = {colors.violet,colors.bg,'bold'},
--   }
-- }

-- gls.right[5] = {
--   DiffAdd = {
--     provider = 'DiffAdd',
--     condition = condition.hide_in_width,
--     -- icon = '  ',
--     icon = ' ',
--     highlight = {colors.green,colors.bg},
--     separator = ' '
--   }
-- }
-- gls.right[6] = {
--   DiffModified = {
--     provider = 'DiffModified',
--     condition = condition.hide_in_width,
--     -- icon = '  ',
--     icon = ' ',
--     highlight = {colors.orange,colors.bg},
--     separator = ' '
--   }
-- }
-- gls.right[7] = {
--   DiffRemove = {
--     provider = 'DiffRemove',
--     condition = condition.hide_in_width,
--     -- icon = '  ',
--     icon = ' ',
--     highlight = {colors.red,colors.bg},
--     separator = ' '
--   }
-- }

-- --[[ gls.right[8] = {
--   RainbowBlue = {
--     provider = function() return ' ' end,
--     highlight = {colors.cyan,colors.bg}
--   },
-- } ]]

-- -- Unfocused splits

-- gls.short_line_left[1] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {'NONE',colors.bg},
--     highlight = {colors.cyan,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_left[2] = {
--   SFileName = {
--     provider =  'SFileName',
--     condition = condition.buffer_not_empty,
--     highlight = {colors.fg,colors.bg,'bold'}
--   }
-- }

-- gls.short_line_right[1] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     highlight = {colors.fg,colors.bg}
--   }
-- }
