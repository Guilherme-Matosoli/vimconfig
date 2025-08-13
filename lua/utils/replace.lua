local M = {}

function M.search_replace_modal()
  vim.ui.input({
    prompt = "Text to find: ",
  }, function(find_text)
    if not find_text or find_text == "" then
      print("Search cancelled")
      return
    end

    vim.ui.input({
      prompt = "Replace with: ",
    }, function(replace_text)
      if not replace_text then
        print("Replace cancelled")
        return
      end

      local cmd = string.format("%%s/\\<%s\\>/%s/",
        vim.fn.escape(find_text, "/\\"),
        vim.fn.escape(replace_text, "/\\"))

      vim.cmd(cmd)
    end)
  end)
end

return M
