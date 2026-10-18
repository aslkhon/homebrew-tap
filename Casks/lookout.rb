cask "lookout" do
  version "0.1.9"
  sha256 "2dc8b10c0b82730547fa5d4303fc237c7854efb783bceb679d02cb4a05b43d02"

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
