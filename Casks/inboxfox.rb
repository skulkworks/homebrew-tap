cask "inboxfox" do
  version "2.1.0,22" # marketing,build — build-stamped DMG URL below
  sha256 "18c60df4cc0081a80c454bc9e9149d0f04867029140b2801976fe144be613101"

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
