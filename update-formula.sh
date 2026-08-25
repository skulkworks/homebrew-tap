#!/bin/bash

# Script to update Homebrew formula with latest release SHA256
# Usage: ./update-formula.sh [version]
# If no version specified, fetches latest release from GitHub

set -e

# Configuration
REPO="skulkworks/rasterfox-cli"
FORMULA_PATH="Formula/rasterfox-cli.rb"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🦊 Updating RasterFox Homebrew Formula"
echo "======================================="

# Get version from argument or fetch latest
if [ -n "$1" ]; then
    VERSION="$1"
    echo "📌 Using specified version: v${VERSION}"
else
    echo "🔍 Fetching latest release from GitHub..."
    VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
    
    if [ -z "$VERSION" ]; then
        echo -e "${RED}❌ Failed to fetch latest release version${NC}"
        echo "Please specify version manually: $0 <version>"
        exit 1
    fi
    echo -e "${GREEN}✓ Latest version: v${VERSION}${NC}"
fi

# Download and calculate SHA256
TARBALL_URL="https://github.com/${REPO}/archive/refs/tags/v${VERSION}.tar.gz"
echo ""
echo "📥 Downloading source tarball..."
echo "   URL: ${TARBALL_URL}"

# Create temp directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Download tarball
curl -L -s -o "${TEMP_DIR}/rasterfox-${VERSION}.tar.gz" "${TARBALL_URL}"

# Calculate SHA256
echo "🔐 Calculating SHA256..."
SHA256=$(shasum -a 256 "${TEMP_DIR}/rasterfox-${VERSION}.tar.gz" | cut -d' ' -f1)
echo -e "${GREEN}✓ SHA256: ${SHA256}${NC}"

# Check if formula exists
if [ ! -f "$FORMULA_PATH" ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Formula not found at: ${FORMULA_PATH}${NC}"
    echo "Creating new formula..."
    
    mkdir -p "$(dirname "$FORMULA_PATH")"
    
    cat > "$FORMULA_PATH" << EOF
class RasterfoxCli < Formula
  desc "Professional image optimization CLI tool for bulk operations"
  homepage "https://github.com/skulkworks/rasterfox-cli"
  url "${TARBALL_URL}"
  sha256 "${SHA256}"
  # Explicit: Homebrew's version detection reads "64" out of an "-arm64.tar.gz" URL.
  version "${VERSION}"
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
EOF
    echo -e "${GREEN}✓ Formula created${NC}"
else
    echo ""
    echo "📝 Updating existing formula..."
    
    # Update URL and SHA256 in the formula
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS sed syntax
        sed -i '' "s|url \".*\"|url \"${TARBALL_URL}\"|g" "$FORMULA_PATH"
        sed -i '' "s|sha256 \".*\"|sha256 \"${SHA256}\"|g" "$FORMULA_PATH"
    else
        # Linux sed syntax
        sed -i "s|url \".*\"|url \"${TARBALL_URL}\"|g" "$FORMULA_PATH"
        sed -i "s|sha256 \".*\"|sha256 \"${SHA256}\"|g" "$FORMULA_PATH"
    fi
    echo -e "${GREEN}✓ Formula updated${NC}"
fi

# Test the formula locally
echo ""
echo "🧪 Testing formula locally..."
echo "   Running: brew audit --strict ${FORMULA_PATH}"

if brew audit --strict "$FORMULA_PATH" 2>/dev/null; then
    echo -e "${GREEN}✓ Formula audit passed${NC}"
else
    echo -e "${YELLOW}⚠️  Formula has audit warnings (may be okay)${NC}"
fi

# Commit changes
echo ""
echo "💾 Committing changes..."

if git diff --quiet; then
    echo -e "${YELLOW}ℹ️  No changes to commit (formula already up to date)${NC}"
else
    git add Formula/rasterfox-cli.rb
    git commit -m "Update RasterFox to v${VERSION}" -m "SHA256: ${SHA256}"
    echo -e "${GREEN}✓ Changes committed${NC}"
    
    echo ""
    echo "📤 Ready to push to GitHub:"
    echo "   git push origin main"
fi

echo ""
echo "======================================="
echo -e "${GREEN}✅ Formula update complete!${NC}"
echo ""
echo "📋 Next steps:"
echo "1. Push changes: git push"
echo "2. Test installation: brew install skulkworks/tap/rasterfox"
echo "3. Verify: rasterfox --version"
echo ""
echo "📊 Formula details:"
echo "   Version: ${VERSION}"
echo "   SHA256:  ${SHA256}"
echo "   Path:    ${FORMULA_PATH}"