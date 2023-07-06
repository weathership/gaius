{ pkgs, ... }:

{
  languages.elixir.enable = true;

  pre-commit.hooks.markdownlint.enable = false;
  pre-commit.hooks.shellcheck.enable = true;

  packages = [ pkgs.inotify-tools ];

  processes = {
    gaius.exec = "mix phx.server";
  };
  services.postgres = {
    enable = true;
    package = pkgs.postgresql_15;
    initialDatabases = [{ name = "gaius"; }];
    extensions = extensions: [
      extensions.postgis
    ];
    initialScript = "CREATE USER postgres SUPERUSER; CREATE DATABASE postgres WITH OWNER postgres;";
  };
}

