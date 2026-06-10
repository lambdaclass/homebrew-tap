class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v16.0.0.tar.gz"
  sha256 "d19ba2c7ac1146b9367828472ff4b58b596c991ee4ee9d967882c965576c27f7"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v16.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8c3e6f108329949ec19aeedddbcab4d6e39486922df4e650b14df7b926b2c305"
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
