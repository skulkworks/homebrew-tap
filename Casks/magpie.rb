cask "magpie" do
  version "2.3.8,33" # marketing,build — build-stamped DMG URL below
  sha256 "33ff47bdb0f13b5db94a9bf74c8f20729fab9a82dfaba90a77e15809b3aea667"

  url "https://updates.skulkworks.dev/magpie/Magpie-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Magpie"
  desc "Screen capture, recording, and annotation tool"
  homepage "https://skulkworks.dev/magpie"

  livecheck do
    url "https://updates.skulkworks.dev/magpie/appcast.xml"
    strategy :sparkle
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Magpie.app"

  zap trash: [
    "~/Library/Application Support/Magpie",
    "~/Library/Caches/dev.skulkworks.magpie",
    "~/Library/Preferences/dev.skulkworks.magpie.plist",
  ]
end
