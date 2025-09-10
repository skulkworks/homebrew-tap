class Rasterfox < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.0/rasterfox-1.2.0-darwin-arm64.tar.gz"
      sha256 "124d555f6e83a8d9f5a7f4d2158113353924d4d068bbb0e4249c8c80c146988c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.0/rasterfox-1.2.0-linux-x86_64.tar.gz"
      sha256 "88cd4c421554e040f96fd80017fe98b451809b84abac691647ee0272cd43dbec"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
