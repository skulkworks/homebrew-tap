# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.9-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.9-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.9-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.9/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.9"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.9/rasterfox-2.3.9-darwin-arm64.tar.gz"
      sha256 "ef63c82846ac2c202d6ba8ec7a3b90d4c5f4b3c96a6c68840b520ca5e6adb5d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.9/rasterfox-2.3.9-linux-x86_64.tar.gz"
      sha256 "b1905d66910ed9567b7479cf3be36b4a29b5b57160e3061625ee2499767d311d"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.9/rasterfox-2.3.9-linux-aarch64.tar.gz"
      sha256 "b436f5fcbda046b7f57d5b1161e60d99af76a1e72968c44bd20da73f8f1ee568"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
