class Tuiagger < Formula
  desc "Terminal UI for viewing and interacting with OpenAPI/Swagger documentation"
  homepage "https://github.com/valVK/tuiagger"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.2/tuiagger_darwin_arm64.tar.gz"
      sha256 "f8a791af6464b2f464447ae9d1ceddf65a77e89bb9005c57652cd1cabf4b1094"
    end
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.2/tuiagger_darwin_amd64.tar.gz"
      sha256 "27cd409084f72164a15c5abb97e1c719a64b020a4f3bbc8a201e4dcf8914afd8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.2/tuiagger_linux_amd64.tar.gz"
      sha256 "03de51504bf9760d6a916939cc60b2b73a7cc25c9ef83615678503f2bed1347a"
    end
    on_arm do
      url "https://github.com/valVK/tuiagger/releases/download/v2.0.2/tuiagger_linux_arm64.tar.gz"
      sha256 "d296363078000fec9ed146565bf9863860eb48f6673c742ab529bfd67aa4831f"
    end
  end

  def install
    bin.install "tuiagger"
  end

  test do
    assert_match "tuiagger", shell_output("#{bin}/tuiagger --version")
  end
end
