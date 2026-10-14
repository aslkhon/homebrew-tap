cask "lookout" do
  version "0.1.3"
  sha256 "1e969580239cb36b93e61459efb527c68d7c7e9136f548de7e5a105dc908f348"

  url "https://github.com/aslkhon/lookout/releases/download/v#{version}/Lookout-#{version}.zip"
  name "Lookout"
  desc "Menu bar monitor for Claude Code and Codex agents"
  homepage "https://github.com/aslkhon/lookout"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Lookout.app"

  uninstall quit: "io.github.aslkhon.lookout"

  zap trash: "~/.lookout"

  caveats <<~EOS
    Lookout is not notarized yet. On first launch, allow it in
      System Settings › Privacy & Security › Open Anyway
    or run:
      xattr -dr com.apple.quarantine #{appdir}/Lookout.app

    Before uninstalling, remove its agent hooks via Lookout › Setup… › Remove Hooks.
  EOS
end
