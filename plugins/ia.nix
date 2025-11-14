{
  config.vim.assistant.copilot = {
    enable = true;
    mappings = {
      panel = {
        jumpNext = "<leader>$";
        jumpPrev = "<leader>^";
      };
      suggestion = {
        next = "<M-$>";
        prev = "<M-^>";
        dismiss = "<M-*>";
        accept = "<M-Enter>";
      };
    };
  };
}
