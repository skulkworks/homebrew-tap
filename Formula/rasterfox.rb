class Rasterfox < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  url "https://github.com/skulkworks/rasterfox-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b85460ed9274d4bd6948ab637747bd4f941ffeba80674000dd11b3ae3a67cd00"
  license "GPL-3.0-or-later"
  head "https://github.com/skulkworks/rasterfox-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Test version output
    assert_match "rasterfox #{version}", shell_output("#{bin}/rasterfox --version")
    
    # Test help output
    assert_match "Professional image optimization", shell_output("#{bin}/rasterfox --help")
    
    # Test dry-run on non-existent file (should show appropriate message)
    output = shell_output("#{bin}/rasterfox nonexistent.png --dry-run 2>&1", 1)
    assert_match(/not found|does not exist|No such file/i, output)
  end
end