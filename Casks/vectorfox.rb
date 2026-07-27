cask "vectorfox" do
  version "1.5.4,38" # marketing,build — build-stamped DMG URL below
  sha256 "8306c67fc0d0d27d5e2721ff5b16c2cec93e56a55fc059e578b4f099a54ad76e"

  url "https://updates.skulkworks.dev/vectorfox/VectorFox-#{version.csv.first}-#{version.csv.second}.dmg"
  name "VectorFox"
  desc "Native macOS raster-to-SVG vectorizer with a Rust SVG optimizer"
  homepage "https://skulkworks.dev/vectorfox"

  livecheck do
    url "https://updates.skulkworks.dev/vectorfox/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma

  app "VectorFox.app"

  zap trash: [
    "~/Library/Application Support/VectorFox",
    "~/Library/Caches/dev.skulkworks.vectorfox.direct",
    "~/Library/Preferences/dev.skulkworks.vectorfox.direct.plist",
  ]
end
