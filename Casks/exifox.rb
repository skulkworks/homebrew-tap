cask "exifox" do
  version "1.0.1,6" # marketing,build — build-stamped DMG URL below
  # PLACEHOLDER — replace after the first direct release with:
  #   shasum -a 256 exifox/build/ExiFox.dmg
  # Homebrew will refuse to install until this matches the published DMG.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
