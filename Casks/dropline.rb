cask "dropline" do
  # 上游的 Release 资产名不带版本号，https://…/releases/latest/download/Dropline.dmg
  # 永远指向最新正式版，所以这里用 :latest —— 换版本时无需改 cask。
  # 应用自带 Sparkle 自动更新，日常升级走它，不依赖 brew upgrade。
  version :latest
  sha256 :no_check

  url "https://github.com/chen86860/dropline/releases/latest/download/Dropline.dmg"
  name "Dropline"
  desc "Uploads any file to your own host and copies the link"
  homepage "https://dropline.emmmm.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Dropline.app"

  # 访达扩展是独立进程，只退主 App 的话旧版本仍会继续弹菜单
  uninstall quit:   [
              "dev.emmmm.Dropline",
              "dev.emmmm.Dropline.Finder",
            ],
            signal: ["TERM", "dev.emmmm.Dropline.Finder"]

  # 图床配置在 UserDefaults，访达扩展的配置在它自己的沙盒容器里。
  # 密钥/Token 存在登录钥匙串（service = dev.emmmm.Dropline），
  # cask 无法代为清理，需要的话自行在「钥匙串访问」里删。
  zap trash: [
    "~/Library/Caches/dev.emmmm.Dropline",
    "~/Library/Containers/dev.emmmm.Dropline.Finder",
    "~/Library/HTTPStorages/dev.emmmm.Dropline",
    "~/Library/HTTPStorages/dev.emmmm.Dropline.binarycookies",
    "~/Library/Preferences/dev.emmmm.Dropline.plist",
    "~/Library/Saved Application State/dev.emmmm.Dropline.savedState",
  ]
end
