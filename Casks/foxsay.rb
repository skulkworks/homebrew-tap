cask "foxsay" do
  version "2.1.1,13" # marketing,build for the build-stamped DMG URL below
  sha256 "2a156bfaeb40d7db9cc2da57f0515e6eaf1361289c808caa3d3efb0a3c8e1ed8"

  url "https://updates.skulkworks.dev/foxsay/FoxSay-#{version.csv.first}-#{version.csv.second}.dmg"
  name "FoxSay"
  desc "On-device speech to text with local AI cleanup"
  homepage "https://skulkworks.dev/foxsay"

  livecheck do
    url "https://updates.skulkworks.dev/foxsay/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma
  # MLX and the on-device speech models are Apple silicon only.
  depends_on arch: :arm64

  app "FoxSay.app"

  zap trash: [
    "~/Library/Application Support/FoxSay",
    "~/Library/Caches/com.skulkworks.FoxSay",
    "~/Library/Preferences/com.skulkworks.FoxSay.plist",
    "~/Library/Saved Application State/com.skulkworks.FoxSay.savedState",
  ]
end
