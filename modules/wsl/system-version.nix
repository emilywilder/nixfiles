# Set Git commit hash for version.
{ inputs, ... }:
{
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
}
