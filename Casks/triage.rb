cask "triage" do
  version "1.0.0,3" # marketing,build for the build-stamped DMG URL below
  sha256 "458b834d5ccc83a10e41e4700e77844394fcf515ef4b8114ef0cca603794bdba" # set by the first release

  url "https://updates.skulkworks.dev/triage/Triage-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Triage"
  desc "Menu bar inbox for GitHub notifications"
  homepage "https://github.com/skulkworks/triage"

  livecheck do
    url "https://updates.skulkworks.dev/triage/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: :tahoe

  app "Triage.app"

  uninstall quit: "dev.skulkworks.triage"

  zap trash: [
    "~/Library/Application Support/dev.skulkworks.triage",
    "~/Library/Caches/dev.skulkworks.triage",
    "~/Library/HTTPStorages/dev.skulkworks.triage",
    "~/Library/Preferences/dev.skulkworks.triage.plist",
  ]
end
