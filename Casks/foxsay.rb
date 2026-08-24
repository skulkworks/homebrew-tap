cask "foxsay" do
  version "2.1.0,12" # marketing,build for the build-stamped DMG URL below
  sha256 "387ac05b93ba37f8d042cdb3ed46ec7053287e537d7486165ab8e75ed1b6d9ae"

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
