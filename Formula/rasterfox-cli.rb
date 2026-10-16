# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.1-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.1-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.1-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.1/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.1"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.1/rasterfox-2.3.1-darwin-arm64.tar.gz"
      sha256 "7b696cf4558646f0df84d8e4a39c2f553a7a095d00364408da35309a1eeef9e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.1/rasterfox-2.3.1-linux-x86_64.tar.gz"
      sha256 "bd247c7b45e5aea7543d60ab9f9108212b6285a98d62ee020547c38c91864103"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.1/rasterfox-2.3.1-linux-aarch64.tar.gz"
      sha256 "3bb839c45b4f856cc47f6b9ac4b1f02e21a8a27049f5869fa609853c72c42ffd"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
