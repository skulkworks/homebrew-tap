cask "vectorfox" do
  version "3.0.3,48" # marketing,build — build-stamped DMG URL below
  sha256 "75264bfe8b69a00cb8c7b9bc29b84d3412793595a16975f9a34cd4a9f52f11fb"

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
