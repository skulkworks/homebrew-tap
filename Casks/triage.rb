cask "triage" do
  version "0.1.0,1" # marketing,build for the build-stamped DMG URL below
  sha256 "358566fa2d025f555585681e4324272b970311fc76cd83a9890fe25e35984dbf" # set by the first release

  url "https://updates.skulkworks.dev/triage/Triage-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Triage"
  desc "Menu bar inbox for GitHub notifications"
  homepage "https://github.com/skulkworks/triage"

  livecheck do
    url "https://updates.skulkworks.dev/triage/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :tahoe"

  app "Triage.app"

  uninstall quit: "dev.skulkworks.triage"

  zap trash: [
    "~/Library/Application Support/dev.skulkworks.triage",
    "~/Library/Caches/dev.skulkworks.triage",
    "~/Library/HTTPStorages/dev.skulkworks.triage",
    "~/Library/Preferences/dev.skulkworks.triage.plist",
  ]
end
