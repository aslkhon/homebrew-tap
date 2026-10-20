cask "lookout" do
  version "0.1.12"
  sha256 "61e21b580f83541ae58a740a61ffee6d903b426c912e1c5d2ca9d03af6a9ffe7"

  url "https://github.com/aslkhon/lookout/releases/download/v#{version}/Lookout-#{version}.zip"
  name "Lookout"
  desc "Menu bar monitor for Claude Code and Codex agents"
  homepage "https://github.com/aslkhon/lookout"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
