cask "vectorfox" do
  version "1.5.3,37" # marketing,build — build-stamped DMG URL below
  sha256 "961d9fb937fefdfadb9072cb59d9a61764a38850f5f67e10563eddb70b656c12"

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
