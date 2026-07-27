cask "exifox" do
  version "1.0.2,7" # marketing,build — build-stamped DMG URL below
  sha256 "99ba3ad4675afd8daa9b5bdf1b27a1b43bcfd8ae0f3ddc5d3b4d0a5cef28a72a"

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
