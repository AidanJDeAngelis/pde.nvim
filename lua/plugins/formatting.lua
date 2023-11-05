return {
  {
    "stevearc/conform.nvim",
    ---@type ConformOpts
    opts = {
      format = {
        lsp_fallback = "always",
      },
      formatters_by_ft = {
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_fix", "ruff_format" }
          else
            return { "black" }
          end
        end,
        ["markdown"] = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle split/join" },
    },
    opts = { use_default_keymaps = false },
  },
}
