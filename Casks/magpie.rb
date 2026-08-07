cask "magpie" do
  version "2.1.2,19" # marketing,build — build-stamped DMG URL below
  sha256 "e2e9458e117829c5edd9f4fa8ad27fd1c790104887572a88538f63b456876e21"

  url "https://updates.skulkworks.dev/magpie/Magpie-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Magpie"
  desc "Screen capture, recording, and annotation tool"
  homepage "https://skulkworks.dev/magpie"

  livecheck do
    url "https://updates.skulkworks.dev/magpie/appcast.xml"
    strategy :sparkle
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Magpie.app"

  zap trash: [
    "~/Library/Application Support/Magpie",
    "~/Library/Caches/dev.skulkworks.magpie",
    "~/Library/Preferences/dev.skulkworks.magpie.plist",
  ]
end
