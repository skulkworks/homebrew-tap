cask "riffle" do
  version "1.3.2,13" # marketing,build — build-stamped DMG URL below
  sha256 "326c36441a9cdfe624fa1e51f0b3abae8dee69464a2d84e03ba94b10878b3bc4"

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
