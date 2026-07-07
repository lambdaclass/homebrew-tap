class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v20.0.0.tar.gz"
  sha256 "4a94e4259ba0822be98608e605f0c9bc4c474e4fed3bc9ef1cfa11132a5f0b1d"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v20.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "def1d6bdd1fb1de739d5e9ccae8a2d88d8c26f7636b1aa118a33c5d9a26ff9f9"
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
