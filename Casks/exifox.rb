cask "exifox" do
  version "1.0.3,8" # marketing,build — build-stamped DMG URL below
  sha256 "ad75cd82a51b0cde6c62d73b5ec7768bcde08efe8ce629f1f15fdced9044d7bb"

  url "https://updates.skulkworks.dev/exifox/ExiFox-#{version.csv.first}-#{version.csv.second}.dmg"
  name "ExiFox"
  desc "Native macOS metadata inspector and editor for photos and videos"
  homepage "https://skulkworks.dev/exifox"

  livecheck do
    url "https://updates.skulkworks.dev/exifox/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma

  app "ExiFox.app"

  zap trash: [
    "~/Library/Caches/dev.skulkworks.exifox.direct",
    "~/Library/Preferences/dev.skulkworks.exifox.direct.plist",
  ]
end
