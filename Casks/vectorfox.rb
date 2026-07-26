cask "vectorfox" do
  version "1.5.3,37" # marketing,build — build-stamped DMG URL below
  sha256 :no_check # TODO: shasum -a 256 build/VectorFox.dmg after the first release

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
