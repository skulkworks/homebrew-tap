cask "magpie" do
  version "2.3.5,30" # marketing,build — build-stamped DMG URL below
  sha256 "345f28202875fb125ab3ba4dc6ebc94e5d786b5011a1f7c7ca39655fa92302d1"

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
