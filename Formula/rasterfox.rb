# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.0.0-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.0.0-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.0.0-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.0.0/

class Rasterfox < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.0.0/rasterfox-2.0.0-darwin-arm64.tar.gz"
      sha256 "c1b0851e9d7c85a4cbc514d9517310ed8912edc1b9f026258797ac66908cec99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.0.0/rasterfox-2.0.0-linux-x86_64.tar.gz"
      sha256 "55ed721baa106273cc24891be1b4aeeaaff618ff80b72bd9786c928db01f3887"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.0.0/rasterfox-2.0.0-linux-aarch64.tar.gz"
      sha256 "6c9bc87dcfd4c19349875ed339980046cb3e1739dc8c07f99705d192b2a32f85"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
