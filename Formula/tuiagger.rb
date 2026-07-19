class Tuiagger < Formula
  desc "TUI Swagger/OpenAPI Documentation Viewer"
  homepage "https://github.com/valVK/twagger"
  url "https://github.com/valVK/tuiagger/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "5ce9f057f1f58c68e872714386ef3f9a516d9d23362839f8138de2e73f7e10a6"
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
