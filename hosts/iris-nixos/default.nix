{ inputs, ... }:

{
  imports =
    [
      (inputs.self + /modules/wsl)
    ];
}
