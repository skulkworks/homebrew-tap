cask "inboxfox" do
  version "1.0.11,18" # marketing,build — build-stamped DMG URL below
  sha256 "c39caf365b52c01a8ee139240be4c80977278845db03e2e5e24a5c69a1e6d947"

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
