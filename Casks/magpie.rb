cask "magpie" do
  version "2.0.1,16" # marketing,build — build-stamped DMG URL below
  sha256 "a30eddd14a7e43946af1b402fafeb3cc1595db59cc321171996208e908670365"

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
