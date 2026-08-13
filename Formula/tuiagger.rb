# Homebrew formula for tuiagger — a terminal UI for viewing and
# interacting with OpenAPI/Swagger documentation.
#
# Tap: valVK/twagger (this repo). Source lives at github.com/valVK/tuiagger.
#
# v2.0.0 is a major bump: the app was rewritten from Node/Ink/TS to Go —
# this formula replaces the old Node-based one wholesale (no more
# `depends_on "node"` / `npm install`).
#
# Cutting a release:
#   1. git tag v2.0.0 && git push --tags (in the tuiagger repo)
#   2. curl -sL https://github.com/valVK/tuiagger/archive/refs/tags/v2.0.0.tar.gz | shasum -a 256
#   3. Update url/sha256 below and push

class Tuiagger < Formula
  desc "Terminal UI for viewing and interacting with OpenAPI/Swagger documentation"
  homepage "https://github.com/valVK/tuiagger"
  url "https://github.com/valVK/tuiagger/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "24eecdbf05c95bf564ef377791d2821e2995e88c52566635e3345831f4f24b12" # filled in when v2.0.0 is actually tagged — see comment above
  license "MIT"
  head "https://github.com/valVK/tuiagger.git", branch: "master"

  depends_on "go" => :build

  def install
    # main.version is a `const`, not a `var` — Go's `-X` linker flag only
    # rewrites package-level string variables, so there's nothing to inject
    # here. Just strip debug info (-s -w), standard for a released binary.
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/tuiagger"
  end

  test do
    assert_match "tuiagger", shell_output("#{bin}/tuiagger --version")
  end
end
