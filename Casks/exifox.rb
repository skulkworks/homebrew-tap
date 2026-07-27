cask "exifox" do
  version "1.0.1,6" # marketing,build — build-stamped DMG URL below
  sha256 "23e1fc96641c62a70c817c76557d38fb740740f6854120ce35a7ad1e4a78d7d5"

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
