# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.0-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.0-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.0-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.0/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.0"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.0/rasterfox-2.3.0-darwin-arm64.tar.gz"
      sha256 "aae4d8ee139efa63cbcf09fa720c3d22965811c6683acc0cada851f9cbf531a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.0/rasterfox-2.3.0-linux-x86_64.tar.gz"
      sha256 "ac92b311683f2453677b7192ae7e8a1955533c1b77a0654481e525dc7c76aa3f"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.0/rasterfox-2.3.0-linux-aarch64.tar.gz"
      sha256 "e47177a17bb9e19550d0b29c7a57a121876033480fe06b0845e6d08496eea314"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
