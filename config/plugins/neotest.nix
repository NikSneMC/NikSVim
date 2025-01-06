{niksvimLib, ...}: {
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = niksvimLib.mkServersList [
      "bash"
      "elixir"
      "golang"
      "gradle"
      "gtest"
      "haskell"
      "java"
      "python"
      "scala"
      "vitest"
    ];
  };
}
