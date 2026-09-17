cask "foxsay" do
  version "2.2.2,16" # marketing,build for the build-stamped DMG URL below
  sha256 "636ed243c04def8805f3db9590f0abea5ff36dbc570d962efce4ac11710499d3"

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
