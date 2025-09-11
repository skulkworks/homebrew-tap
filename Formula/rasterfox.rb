# Additional binaries available for direct download:
# - Linux ARMv7 (32-bit ARM): rasterfox-1.2.6-linux-armv7.tar.gz
# - Linux x86_64 musl (Alpine/static): rasterfox-1.2.6-linux-x86_64-musl.tar.gz
# - Linux ARM64 musl (Alpine/static): rasterfox-1.2.6-linux-aarch64-musl.tar.gz
# Download from: https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.6/

class Rasterfox < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.6/rasterfox-1.2.6-darwin-arm64.tar.gz"
      sha256 "0cbf2f43688b369a6774a09d1bd658a74677e89e7aff25fa3a86dc4bccf9a63a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.6/rasterfox-1.2.6-linux-x86_64.tar.gz"
      sha256 "ad89196ca157e5143cfd17fd809dcf80ac0d406072af2446462fa3c6e4d0ce94"
    end
    on_arm do
      # ARM64 (64-bit ARM, includes modern Raspberry Pi, AWS Graviton, etc.)
      url "https://github.com/skulkworks/homebrew-tap/releases/download/rasterfox-1.2.6/rasterfox-1.2.6-linux-aarch64.tar.gz"
      sha256 "27bc41c363f41f742388337566f7281ba03d917ba481ef7d5e539b5f471dd30f"
    end
  end

  def install
    bin.install "rasterfox"
  end

  test do
    assert_match "rasterfox", shell_output("#{bin}/rasterfox --version")
  end
end
