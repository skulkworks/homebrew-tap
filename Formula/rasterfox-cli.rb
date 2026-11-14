# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-2.3.2-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-2.3.2-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-2.3.2-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.2/

class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent
  version "2.3.2"

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.2/rasterfox-2.3.2-darwin-arm64.tar.gz"
      sha256 "f27eb20e678681830b09387a858e1281fa98241c15064908a1ab37cc5fcad6d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.2/rasterfox-2.3.2-linux-x86_64.tar.gz"
      sha256 "a99cb32030e3bca544c806201c514ffe979d04e7be92638ae646aad714b52d56"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-2.3.2/rasterfox-2.3.2-linux-aarch64.tar.gz"
      sha256 "33b5facea470f265b39920c36d5be0b078c5446951122253850bb86ff636d8a4"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
