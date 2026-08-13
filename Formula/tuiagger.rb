class Tuiagger < Formula
  desc "Terminal UI for viewing and interacting with OpenAPI/Swagger documentation"
  homepage "https://github.com/valVK/tuiagger"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.1/tuiagger_darwin_arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.1/tuiagger_darwin_amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.1/tuiagger_linux_amd64.tar.gz"
      sha256 "51760a3c1048c9f09dec194fce683644a115fd7baf06858d4eed3da876014df4"
    end
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.1/tuiagger_linux_arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "tuiagger"
  end

  test do
    assert_match "tuiagger", shell_output("#{bin}/tuiagger --version")
  end
end
