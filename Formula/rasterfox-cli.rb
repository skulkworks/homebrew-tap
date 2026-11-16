# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.6-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.6-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.6-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.6/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.6"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.6/rasterfox-2.3.6-darwin-arm64.tar.gz"
      sha256 "dc3a92542f8e35b25d69b74f70a8a5520c8a400e5eebc1e693bb81fb024ff00f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.6/rasterfox-2.3.6-linux-x86_64.tar.gz"
      sha256 "a25204b218ed861eb767a094e7872959388ae0353deeef8c8b53a60db3dfceb0"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.6/rasterfox-2.3.6-linux-aarch64.tar.gz"
      sha256 "e57cdc24a8f003f7f7b3e4e7bec7ef329bffea4eb7d7b1e8dc2c0ce052eb0978"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
