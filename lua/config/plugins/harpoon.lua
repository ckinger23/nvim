return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		},
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup({
				settings = {
					key = function()
						local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
						return git_root or vim.loop.cwd()
					end,
				},
				default = {
					get_root_dir = function()
						-- Force harpoon to use absolute paths from git root
						local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
						return git_root or vim.loop.cwd()
					end,
				},
			})
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-1>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-2>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-3>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-4>", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
