# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.4-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.4-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.4-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.4/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.4"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.4/rasterfox-2.3.4-darwin-arm64.tar.gz"
      sha256 "61bffd7290ccd0a52e3afcd4b466a4a7c4c873c9893f725ad0a1774ff03793ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.4/rasterfox-2.3.4-linux-x86_64.tar.gz"
      sha256 "c97aa988ac39c528a2030e9c0956cad0bca48f458985de03801289f58a8aaf4b"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.4/rasterfox-2.3.4-linux-aarch64.tar.gz"
      sha256 "c0511b88e3501a30d8cb90b988be868bd53661113a23a2cc8cdb2bd063275b51"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
