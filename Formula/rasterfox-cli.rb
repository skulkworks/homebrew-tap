# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.7-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.7-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.7-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.7/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.7"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.7/rasterfox-2.3.7-darwin-arm64.tar.gz"
      sha256 "2175f48767f59e9f773f511d4111ad85e08256806a2595d20d1edbe3afeddec8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.7/rasterfox-2.3.7-linux-x86_64.tar.gz"
      sha256 "bb203593655c7532a4875d3ffe95822612533e71d6ddccdc4a65e0280e922c61"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.7/rasterfox-2.3.7-linux-aarch64.tar.gz"
      sha256 "98d6bf1be547e3bbf09c347dfb17460007e9e47486cb701085811d0158c36d2c"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
