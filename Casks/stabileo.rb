cask "stabileo" do
  version "0.1.0-alpha.3"
  sha256 "0ebd99df15dcf373d06052493700d9820ff08c42b2c8a8b1ea9ca97756fed35c"

  url "https://github.com/lambdaclass/stabileo/releases/download/desktop-v#{version}/Stabileo_#{version}_universal.dmg"
  name "Stabileo"
  desc "Structural analysis of 2D and 3D frames and trusses"
  homepage "https://stabileo.com/"

  # Desktop versions are the desktop-v* tags; the repository's latest release is the web app's.
  livecheck do
    url "https://github.com/lambdaclass/stabileo.git"
    regex(/^desktop-v(\d+(?:\.\d+)+(?:-(?:alpha|beta|rc)\.\d+)?)$/i)
  end

  auto_updates true
  depends_on :macos

  app "Stabileo.app"

  zap trash: [
    "~/Library/Application Support/com.stabileo.desktop",
    "~/Library/Caches/com.stabileo.desktop",
    "~/Library/Logs/com.stabileo.desktop",
    "~/Library/Saved Application State/com.stabileo.desktop.savedState",
    "~/Library/WebKit/com.stabileo.desktop",
  ]

  caveats <<~EOS
    Stabileo is not signed with an Apple Developer ID yet, so macOS blocks it the first time.
    macOS 15 (Sequoia) and later: open Stabileo once, then go to System Settings >
      Privacy & Security, find "Stabileo was blocked...", click Open Anyway and confirm.
    macOS 14 and earlier: right-click Stabileo in Applications, choose Open, then Open.
    Any version, in Terminal:
      xattr -dr com.apple.quarantine /Applications/Stabileo.app
    Only once: updates open without asking. Guide:
      https://github.com/lambdaclass/stabileo/blob/desktop/docs/desktop/INSTALL.md
  EOS
end
