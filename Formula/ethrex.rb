class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v22.0.0.tar.gz"
  sha256 "4de788877d4b31855aba9adbe81eff39d0160e6a0091efa977dc543bf4b229d7"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v22.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d3010e5ba0aeeb928c77c6e5c1cdfe278c261074f1707a284a8212f461c67332"
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
