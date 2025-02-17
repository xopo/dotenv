return {
    {
        dir = "~/learn/lua/fzf-worktree.nvim/dev",
        enabled = false,
        event = "VeryLazy",
        config = function()
            print("loading worktree")
            require("fzf-worktree")
        end,
    },
    {
        dir = "~/learn/lua/present.nvim",
        enabled = false,
        event = "VeryLazy",
        config = function()
            require("present")
        end,
    },
}
