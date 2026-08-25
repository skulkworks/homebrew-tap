# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.2.0-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.2.0-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.2.0-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.0/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  # Explicit: the per-platform URLs end in "-arm64.tar.gz", and Homebrew's version
  # detection pulls "64" out of that rather than the 2.2.0 earlier in the name.
  version "2.2.0"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.0/rasterfox-2.2.0-darwin-arm64.tar.gz"
      sha256 "a43f4f1dfbc2432da34f92b3d317585a4c05a7ed29fb251823cac7098191399f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.0/rasterfox-2.2.0-linux-x86_64.tar.gz"
      sha256 "a41c793a19b91535941275300f4866a1470e4891ddfafc5998c0828bb2321dde"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.2.0/rasterfox-2.2.0-linux-aarch64.tar.gz"
      sha256 "5211052e01749661f4a6bfcbcf27edd8fb6799ab3d77d31f89e0ccfcee68d9e5"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
