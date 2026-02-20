{ inputs, ... }:

{
  imports =
    [
      (inputs.self + /modules/macos)
    ];

  networking.hostName = "athena";
}
