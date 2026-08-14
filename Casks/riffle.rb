cask "riffle" do
  version "2.0.7,50" # marketing,build — build-stamped DMG URL below
  sha256 "2fd98d2081d624fd2d992b3871dff507b0f46a13f60b47fa3eb0ae3c4b186d28"

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
