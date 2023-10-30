{
  description = "My neovim config";

  outputs = { self }: let
    in {
      src = "${./.}";
    };
}
