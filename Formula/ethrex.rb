class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b97c66ff0f6bac5f825e64610922fd61d7cac6aa2827f086cd72493b7b199e23"
  license "Apache-2.0"

  depends_on "rustup" => :build

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  def install
    system "rustup", "toolchain", "install", "1.87"
    system "cargo", "install", *std_cargo_args(path: "cmd/ethrex")
  end

  # test do
  #   assert_match "ethrex", shell_output("#{bin}/ethrex --version")
  # end
end
