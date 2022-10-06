self: super: {
  elixir = (super.beam.packagesWith super.erlang).elixir.override {
    src = builtins.fetchGit {
      url = "https://github.com/elixir-lang/elixir";
      ref = "main";
    };
    minimumOTPVersion = "22";
  };
}
