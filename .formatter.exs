[
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  plugins: [
    FreedomFormatter,
  ],
  trailing_comma: true,
  local_pipe_with_parens: true,
]
