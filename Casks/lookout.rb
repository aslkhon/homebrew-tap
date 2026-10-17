cask "lookout" do
  version "0.1.6"
  sha256 "26fe65ef8b46d7916140697d2825ed12421a26928e16eabb79c0a2801cdea7e6"

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
