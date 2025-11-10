{
  config.vim.assistant.copilot = {
    enable = true;
    mappings = {
      panel = {
        jumpNext = "$$";
        jumpPrev = "^^";
      };
      suggestion = {
        next = "<M-$>";
        prev = "<M-^>";
        dismiss = "<C-$>";
      };
    };
  };
}
