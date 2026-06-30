class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v19.0.0.tar.gz"
  sha256 "31c1c7be66b2ee4b2613d83e1d251c54cebbf643485c5d98b4b1d634aeacbd88"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v19.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6f8551f6a09e26270f899b03c99e1cf167b8f3f2ab2a1324aaa0e0233400dee2"
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
