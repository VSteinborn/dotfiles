return {
  -- The plugin location on GitHub
  "vimwiki/vimwiki",
  -- The event that triggers the plugin
  event = "BufEnter *.md",
  -- The keys that trigger the plugin
  keys = { "<leader>ww", "<leader>wt" },
  -- The configuration for the plugin
  init = function()
    vim.g.vimwiki_list = {
      {
        -- [[ Personal Wiki ]]
        -- Here will be the path for your wiki
        path = os.getenv("THELIBRARYPATH"),
        -- The syntax for the wiki
        syntax = "markdown",
        ext = ".md",
      },
      {
        -- [[ Docs Wiki ]]
        path = os.getenv("DOTFILEPATH").."/docs/src/",
        syntax = "markdown",
        ext = ".md",
        -- Index page of wiki
        index = "SUMMARY"
       },
    }
    vim.g.vimwiki_ext2syntax = {['.md'] = 'markdown', ['.markdown'] = 'markdown'}
  end,
}
