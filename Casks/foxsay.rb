cask "foxsay" do
  version "1.0.0"
  sha256 :no_check  # Update with actual SHA after first release

  url "https://github.com/skulkworks/foxsay/releases/download/v#{version}/FoxSay.dmg"
  name "FoxSay"
  desc "Speech-to-text for developers with AI-powered correction"
  homepage "https://skulkworks.dev/foxsay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "FoxSay.app"

  zap trash: [
    "~/Library/Application Support/FoxSay",
    "~/Library/Caches/com.skulkworks.FoxSay",
    "~/Library/Preferences/com.skulkworks.FoxSay.plist",
    "~/Library/Saved Application State/com.skulkworks.FoxSay.savedState",
  ]
end
