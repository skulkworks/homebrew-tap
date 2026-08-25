# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.2.1-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.2.1-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.2.1-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.1/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.2.1"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.1/rasterfox-2.2.1-darwin-arm64.tar.gz"
      sha256 "13f593872c3dbe5c9a7a0f40fab2be17768b0bf66c86df0f3c062249bf3df2a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.1/rasterfox-2.2.1-linux-x86_64.tar.gz"
      sha256 "8ab04cbbdd648c4a8dc9cbf88ecf232f6f9a39a579149553876f847ac2edc601"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.1/rasterfox-2.2.1-linux-aarch64.tar.gz"
      sha256 "d27bb80a53985b584a032a5ee8f743a166ec9b42c9cd9f76dbbe0526a5a8cfa8"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
