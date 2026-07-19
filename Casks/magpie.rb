cask "magpie" do
  version "1.0.2,4" # marketing,build — build-stamped DMG URL below
  sha256 "8ce50cc6a6cda62786d1e5f135da8a983c7947c848b2e47eda9b9d3a46c30736"

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
