cask "inboxfox" do
  version "1.0.10,17" # marketing,build — build-stamped DMG URL below
  sha256 "74ef6404ea834d181756b1bad41508221104895cf7c1b7e4cbf4a15f7cfa8c76"

  url "https://updates.skulkworks.dev/inboxfox/InboxFox-#{version.csv.first}-#{version.csv.second}.dmg"
  name "InboxFox"
  desc "Native macOS SMTP email debugger for local development"
  homepage "https://skulkworks.dev/inboxfox"

  livecheck do
    url "https://updates.skulkworks.dev/inboxfox/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :sonoma

  app "InboxFox.app"

  zap trash: [
    "~/Library/Application Support/dev.skulkworks.inboxfox",
    "~/Library/Application Support/InboxFox",
    "~/Library/Caches/dev.skulkworks.inboxfox.direct",
    "~/Library/Preferences/dev.skulkworks.inboxfox.direct.plist",
  ]
end
