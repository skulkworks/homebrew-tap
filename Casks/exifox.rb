cask "exifox" do
  version "1.0.3,8" # marketing,build — build-stamped DMG URL below
  sha256 "e5c0bd92b8d84d43337321b0ba70f7a41144d759cf888da4495cbf31d34d6bb2"

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
