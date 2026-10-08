cask "easy-complete" do
  version :latest
  sha256 :no_check

  url "https://github.com/chen86860/easy-complete/releases/latest/download/Easy-Complete-arm64.dmg"
  name "Easy Complete"
  desc "IDE-style inline autocomplete for terminals"
  homepage "https://easy-complete.emmmm.dev/"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Easy Complete.app"

  uninstall quit: "dev.emmmm.easy-complete"

  zap trash: [
    "~/.local/bin/ec",
    "~/.local/bin/ecterm",
    "~/.local/share/easy-complete",
    "~/Library/Application Support/easy-complete",
    "~/Library/Input Methods/EasyCompleteInputMethod.app",
    "~/Library/LaunchAgents/dev.emmmm.easy-complete.plist",
    "~/Library/Preferences/dev.emmmm.easy-complete.inputmethod.plist",
    "~/Library/Preferences/dev.emmmm.easy-complete.plist",
  ]
end
