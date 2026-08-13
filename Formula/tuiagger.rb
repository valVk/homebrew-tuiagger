# Homebrew formula for tuiagger — a terminal UI for viewing and
# interacting with OpenAPI/Swagger documentation.
#
# Tap: valVK/tuiagger (this repo, github.com/valVK/homebrew-tuiagger).
# Source lives at github.com/valVK/tuiagger.
#
# This formula installs a precompiled binary (clients don't have Go
# installed) — it's rewritten automatically by the "Release" workflow in
# the tuiagger repo (.github/workflows/release.yml) on every tagged
# release, via the update-tap job pushing here with HOMEBREW_TAP_TOKEN.
# Don't hand-edit url/sha256 values below; they get overwritten on the
# next release. Manual edits are fine for anything else (desc, license).

class Tuiagger < Formula
  desc "Terminal UI for viewing and interacting with OpenAPI/Swagger documentation"
  homepage "https://github.com/valVK/tuiagger"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.0/tuiagger_darwin_arm64.tar.gz"
      sha256 "" # filled in by CI on release
    end
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.0/tuiagger_darwin_amd64.tar.gz"
      sha256 "" # filled in by CI on release
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.0/tuiagger_linux_amd64.tar.gz"
      sha256 "" # filled in by CI on release
    end
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.0/tuiagger_linux_arm64.tar.gz"
      sha256 "" # filled in by CI on release
    end
  end

  def install
    bin.install "tuiagger"
  end

  test do
    assert_match "tuiagger", shell_output("#{bin}/tuiagger --version")
  end
end
