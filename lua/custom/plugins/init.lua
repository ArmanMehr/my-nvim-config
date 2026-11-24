--
return {
  -- Theme
  { 'folke/tokyonight.nvim', priority = 1000 },
  { 'Mofiqul/vscode.nvim', priority = 1000 },
  { 'navarasu/onedark.nvim', priority = 1000 },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'boonyarit-iamsaard/dark-2026.nvim', priority = 1000 },
  { 'rebelot/kanagawa.nvim', priority = 1000 },
  { 'olimorris/onedarkpro.nvim', priority = 1000 },
  { 'rose-pine/neovim', priority = 1000 },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_foreground = 'mix' -- 'material', 'mix', 'original'
      vim.g.gruvbox_material_background = 'medium' -- 'soft', 'medium', 'hard'
    end,
  },
  {

    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()

      local set = vim.keymap.set

      set({ 'n', 'x' }, '<up>', function() mc.lineAddCursor(-1) end, { desc = 'Add cursor above' })
      set({ 'n', 'x' }, '<down>', function() mc.lineAddCursor(1) end, { desc = 'Add cursor below' })
      set({ 'n', 'x' }, '<leader><up>', function() mc.lineSkipCursor(-1) end, { desc = 'Skip cursor above' })
      set({ 'n', 'x' }, '<leader><down>', function() mc.lineSkipCursor(1) end, { desc = 'Skip cursor below' })

      set({ 'n', 'x' }, '<leader>n', function() mc.matchAddCursor(1) end, { desc = 'Add cursor to next match' })
      set({ 'n', 'x' }, '<leader>s', function() mc.matchSkipCursor(1) end, { desc = 'Skip current match' })
      set({ 'n', 'x' }, '<leader>N', function() mc.matchAddCursor(-1) end, { desc = 'Add cursor to previous match' })
      set({ 'n', 'x' }, '<leader>S', function() mc.matchSkipCursor(-1) end, { desc = 'Skip previous match' })

      set('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Add/remove cursor at mouse' })
      set('n', '<c-leftdrag>', mc.handleMouseDrag, { desc = 'Drag to add cursors' })
      set('n', '<c-leftrelease>', mc.handleMouseRelease, { desc = 'Finish mouse drag' })

      set({ 'n', 'x' }, '<leader>a', mc.matchAllAddCursors, { desc = 'Select all matching words' })

      set('n', '<leader>A', mc.alignCursors, { desc = 'Align cursor columns' })

      set({ 'n', 'x' }, '<c-q>', mc.toggleCursor, { desc = 'Toggle multicursors' })

      mc.addKeymapLayer(function(layerSet)
        layerSet({ 'n', 'x' }, '<left>', mc.prevCursor, { desc = 'Previous cursor' })
        layerSet({ 'n', 'x' }, '<right>', mc.nextCursor, { desc = 'Next cursor' })

        layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor, { desc = 'Delete current cursor' })

        layerSet('n', '<esc>', function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end, { desc = 'Enable/clear cursors' })
      end)

      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { reverse = true })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
      hl(0, 'MultiCursorDisabledCursor', { reverse = true })
      hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
    end,
  },

  { 'petertriho/nvim-scrollbar', config = function() require('scrollbar').setup() end },
  { 'mrcjkb/rustaceanvim', version = '^9', lazy = false },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function() require('lsp-file-operations').setup() end,
  },
  {
    'shortcuts/no-neck-pain.nvim',
    config = function()
      require('no-neck-pain').setup {
        width = 120,
        buffers = {
          wo = {
            fillchars = 'eob: ',
          },
        },
      }
      -- vim.cmd 'NoNeckPain'
    end,
  },
  {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
      'm00qek/baleia.nvim',
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
    },
  },
}
