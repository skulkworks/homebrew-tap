# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.1.0-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.1.0-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.1.0-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.1.0/

class Rasterfox < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.1.0/rasterfox-2.1.0-darwin-arm64.tar.gz"
      sha256 "80b95a984c0b0316649ed1b5b1faf54b06511eecb01a2fd53bca4e9456a2e207"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.1.0/rasterfox-2.1.0-linux-x86_64.tar.gz"
      sha256 "76d055042c2476b827d5d1abef39baedc0075a142f5c4c727b058ecc98f59965"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.1.0/rasterfox-2.1.0-linux-aarch64.tar.gz"
      sha256 "ff6764f8b7cae1ae2773577555395815b67b3b6b1371f52841aab3daf35b88f7"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
