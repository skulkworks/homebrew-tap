cask "foxsay" do
  version "2.2.1,15" # marketing,build for the build-stamped DMG URL below
  sha256 "9c1c0eea99515e15b6074e8e856abc8513687bf880690d174d716744cffaffa7"

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
