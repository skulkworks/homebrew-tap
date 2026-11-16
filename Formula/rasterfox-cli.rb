# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.5-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.5-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.5-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.5/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.5"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.5/rasterfox-2.3.5-darwin-arm64.tar.gz"
      sha256 "b8d09a4f07489e046b96eba576bafe114d08c50353c843a95132ab018b93e5fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.5/rasterfox-2.3.5-linux-x86_64.tar.gz"
      sha256 "be3a3f3f0e4e2e530f520e2cf7afaf0def70f2fe3aaacd8f491aff8e70bc5ff1"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.5/rasterfox-2.3.5-linux-aarch64.tar.gz"
      sha256 "6ce48b949f30537da549f6e756bde0b24a514df0e9709f50c630e8c613cb6192"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
