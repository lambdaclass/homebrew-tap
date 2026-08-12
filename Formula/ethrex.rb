class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v24.0.0.tar.gz"
  sha256 "6fa5e4efb0b49351a5ede04cac087481db99a1cb32f6836a1895037efc3de493"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v24.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "40ca1d79b0d618da24926d35248b8b5884f22c3b8e9c8105be85b441feda4c8e"
  end

  depends_on "rustup" => :build

  def install
    system "rustup", "toolchain", "install", "1.91"
    system "cargo", "install", *std_cargo_args(path: "cmd/ethrex")
  end

  # test do
  #   assert_match "ethrex", shell_output("#{bin}/ethrex --version")
  # end
end
