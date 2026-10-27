cask "easy-kap" do
  # 上游的 Release 资产名不带版本号，https://…/releases/latest/download/EasyKap.dmg
  # 永远指向最新正式版，所以这里用 :latest —— 换版本时无需改 cask。
  # 应用自带 Sparkle 自动更新，日常升级走它，不依赖 brew upgrade。
  version :latest
  sha256 :no_check

  url "https://github.com/chen86860/easy-kap/releases/latest/download/EasyKap.dmg"
  name "Easy Kap"
  desc "Screen recorder inspired by Kap"
  homepage "https://easy-kap.emmmm.dev/"

  depends_on macos: :sequoia

  app "Easy Kap.app"

  uninstall quit: "io.github.chen86860.EasyKap"

  # 导出的录屏由用户自己选位置保存，这里不碰；缓存里只有未导出的临时录屏。
  zap trash: [
    "~/Library/Caches/io.github.chen86860.EasyKap",
    "~/Library/HTTPStorages/io.github.chen86860.EasyKap",
    "~/Library/HTTPStorages/io.github.chen86860.EasyKap.binarycookies",
    "~/Library/Preferences/io.github.chen86860.EasyKap.plist",
    "~/Library/Saved Application State/io.github.chen86860.EasyKap.savedState",
  ]
end
