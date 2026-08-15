class Tuiagger < Formula
  desc "Terminal UI for viewing and interacting with OpenAPI/Swagger documentation"
  homepage "https://github.com/valVK/tuiagger"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.1.0/tuiagger_darwin_arm64.tar.gz"
      sha256 "bc9598ac7b0fd118b297630bbf56143129a196ef391fccc40823b944ed9565f3"
    end
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.1.0/tuiagger_darwin_amd64.tar.gz"
      sha256 "d8efad3d510ceae2baf3a774330ce483103b8751a99e9128d7fdaba715f72a1d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.1.0/tuiagger_linux_amd64.tar.gz"
      sha256 "c201bba5a0789b31d63f9e5edb18f07fde9a4176105c89f9d488ce4005c96aa1"
    end
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.1.0/tuiagger_linux_arm64.tar.gz"
      sha256 "fbeef32025ea4fd097b1ec1cc46706ef323e63a3f9b1f6dcec7e88097f2a13a0"
    end
  end

  def install
    bin.install "tuiagger"
  end

  test do
    assert_match "tuiagger", shell_output("#{bin}/tuiagger --version")
  end
end
