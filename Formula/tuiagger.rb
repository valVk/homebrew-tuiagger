class Tuiagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/tuiagger/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "ae40a97137c5741a1ef5e9116b5cb77875484a71b4950f7c83ff5e2f8c01b8ab"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--no-audit", "--no-fund"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    bin.install_symlink libexec/"dist/index.js" => "tuiagger"
  end

  test do
    assert_match "TUI Swagger", shell_output("#{bin}/tuiagger --help 2>&1")
  end
end
