cask "riffle" do
  version "1.3.4,15" # marketing,build — build-stamped DMG URL below
  sha256 "f30805fa187e234a8ea5ed8f1204e091e0bc4fa4bf8d1ee39a850a37bf9e409d"

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
