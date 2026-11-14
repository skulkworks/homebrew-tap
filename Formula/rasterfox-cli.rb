# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.3-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.3-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.3-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.3/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.3"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.3/rasterfox-2.3.3-darwin-arm64.tar.gz"
      sha256 "300caea9797ae932350ff308e79e8ca704ac3808fd49b694335905917e2d8c62"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.3/rasterfox-2.3.3-linux-x86_64.tar.gz"
      sha256 "7882455796431c8bc485e1001eda6bfcfd9a0e5f79e9f67427f3bc46e712ef4b"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.3/rasterfox-2.3.3-linux-aarch64.tar.gz"
      sha256 "5a572d60f9595bbfe20a89cb68bd1e0dd4161748076a826e16d1ed40b199f0d6"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
