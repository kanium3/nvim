-- using lazy.nvim
return {
    "LintaoAmons/cd-project.nvim",
    event = { "VeryLazy" },
    opts = {
        project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
        choice_format = "path",
        projects_picker = "telescope",
    },
}
