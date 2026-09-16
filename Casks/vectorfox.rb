cask "vectorfox" do
  version "3.0.5,50" # marketing,build — build-stamped DMG URL below
  sha256 "f761f35585e2ebeb256798a6b78e4c681371e8775f65736bab568466b1e535a0"

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
