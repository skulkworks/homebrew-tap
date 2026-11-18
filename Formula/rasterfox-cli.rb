# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.8-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.8-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.8-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.8/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.8"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.8/rasterfox-2.3.8-darwin-arm64.tar.gz"
      sha256 "a4b7fc6a1f0a05f9f8bbc1c8621d6a051e1adc7ab2004369bf143e4bd5b350da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.8/rasterfox-2.3.8-linux-x86_64.tar.gz"
      sha256 "b5f754d5af6fb93b6e6fd63bb7dd30b0ff11b4e55aa84e53d5414fae0ef05487"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.8/rasterfox-2.3.8-linux-aarch64.tar.gz"
      sha256 "57f0857f105604d05195ffd2fed05a7080c14a5e105b5e6d8e25d46e2cd10983"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
