cask "rasterfox" do
  version "3.2.3,63" # marketing,build — build-stamped DMG URL below
  sha256 "08a91a2f24af9f39f89828c853c742c7409708445c9c3dd4290130bb4c04742f"

  url "https://updates.skulkworks.dev/rasterfox/RasterFox-#{version.csv.first}-#{version.csv.second}.dmg"
  name "RasterFox"
  desc "Native macOS image optimizer for PNG, JPEG, WebP and AVIF"
  homepage "https://skulkworks.dev/rasterfox"

  livecheck do
    url "https://updates.skulkworks.dev/rasterfox/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma
  # Apple silicon only: the Rust optimizer, jpegli, hwy and the realesrgan upscaler
  # are all arm64-only, the same as the Mac App Store build.
  depends_on arch: :arm64

  app "RasterFox.app"

  zap trash: [
    "~/Library/Application Support/RasterFox",
    "~/Library/Caches/dev.skulkworks.rasterfox.direct",
    "~/Library/Preferences/dev.skulkworks.rasterfox.direct.plist",
  ]
end
