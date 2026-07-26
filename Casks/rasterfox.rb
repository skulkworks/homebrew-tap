cask "rasterfox" do
  version "2.0.2,46" # marketing,build — build-stamped DMG URL below
  sha256 "d164f6c901b4a642a937296d53637e40e868a96c32db90628e35a321610b305b"

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
