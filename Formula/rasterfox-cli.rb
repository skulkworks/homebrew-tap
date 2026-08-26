# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.2.2-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.2.2-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.2.2-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.2/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.2.2"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.2/rasterfox-2.2.2-darwin-arm64.tar.gz"
      sha256 "5e06e73362fb950311d90d1ec4dda604c81d23c557649dda1a80c57f9b8bb648"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.2/rasterfox-2.2.2-linux-x86_64.tar.gz"
      sha256 "e379ba65f26f1bc8e997857228986687c9ffe58d6e6f8034fdc6e83180f5af89"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.2/rasterfox-2.2.2-linux-aarch64.tar.gz"
      sha256 "347b1c3648ac1a037f158399304e734b6bbf55844bac9379f0326c725262317e"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
