cask "riffle" do
  version "2.0.8,51" # marketing,build — build-stamped DMG URL below
  sha256 "e327d9beede11441de1df2e554588be1d2c783c74110abac5adcf06014c73402"

  url "https://updates.skulkworks.dev/riffle/Riffle-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Riffle"
  desc "Fast, native diff and merge for macOS"
  homepage "https://skulkworks.dev/riffle"

  livecheck do
    url "https://updates.skulkworks.dev/riffle/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma

  app "Riffle.app"

  zap trash: [
    "~/Library/Application Support/Riffle",
    "~/Library/Caches/dev.skulkworks.riffle",
    "~/Library/Preferences/dev.skulkworks.riffle.plist",
  ]
end
