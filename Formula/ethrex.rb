class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v15.0.0.tar.gz"
  sha256 "415673010fbe08d09669b659ce2a1d901b244ff29868e14cd938a80d467f1fe9"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v15.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "808e2d3e645ec3765aa2d02c2e9c55cc5e6e424ebd33e2735e8f4d6e1464ce9c"
  end

  depends_on "rustup" => :build

  def install
    system "rustup", "toolchain", "install", "1.90"
    system "cargo", "install", *std_cargo_args(path: "cmd/ethrex")
  end

  # test do
  #   assert_match "ethrex", shell_output("#{bin}/ethrex --version")
  # end
end
