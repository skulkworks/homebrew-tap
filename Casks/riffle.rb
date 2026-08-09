cask "riffle" do
  version "2.0.2,45" # marketing,build — build-stamped DMG URL below
  sha256 "6d4cd3d7f5c304e9bbf242ebce4d3fc5c28e5db7d2a12bdf1fe9906bd6ba578b"

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
