local Util = require("lazyvim.util")

return {
  {
    "folke/trouble.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        width = 30,
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree",
      },
      { "<leader>E", false },
      { "<leader>ge", false },
      { "<leader>be", false },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      { "<c-s>", mode = { "c" }, false },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>fh"] = { name = "+harpoon" },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>xt", false },
      { "<leader>xT", false },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      config = function(_, opts)
        local telescope = require("telescope")
        telescope.load_extension("undo")
      end,
    },
    keys = {
      { "<leader>,", false },
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader><space>", false },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fc", Util.telescope.config_files(), desc = "Find Config File" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fr", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { '<leader>s"', false },
      { "<leader>sa", false },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", false },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", false },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", false },
      { "<leader>sm", false },
      { "<leader>so", false },
      { "<leader>sR", false },
      { "<leader>s<CR>", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
      -- undo
      { "<leader>su", "<CMD>Telescope undo<CR>", desc = "Undo history" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "%.venv/.*",
          "venv/.*",
          ".*%.out/.*",
          "node_modules/.*",
          "dist/.*",
        },
        git_worktrees = vim.g.git_worktrees,
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
  },
  { import = "lazyvim.plugins.extras.editor.aerial" },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      {
        "<leader>fha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add file",
      },
      {
        "<leader>fhe",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle quick menu",
      },
      {
        "<C-p>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Goto previous mark",
      },
      {
        "<C-n>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Goto next mark",
      },
    },
  },
}
