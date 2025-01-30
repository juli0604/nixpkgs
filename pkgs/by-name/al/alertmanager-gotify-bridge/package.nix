{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "alertmanager-gotify-bridge";
  version = "2.3.1";

  src = fetchFromGitHub {
    owner = "DRuggeri";
    repo = "alertmanager_gotify_bridge";
    tag = "v${version}";
    hash = "sha256-yXPOrpkhQUNPg5YNBxsgGijT1utRcUZ1k38T7wmkbgg=";
  };

  vendorHash = "sha256-APFoNLCrSiAoeuVIzlnmtUthyqFDcG0cjoJf/jGbrTg=";

  patches = [
    ./go.mod.patch
    ./go.sum.patch
  ];

  meta = {
    description = "A bridge between Prometheus AlertManager and a Gotify server";
    homepage = "https://github.com/DRuggeri/alertmanager_gotify_bridge";
    changelog = "https://github.com/DRuggeri/alertmanager_gotify_bridge/releases/tag/v${version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ juli0604 ];
  };
}
