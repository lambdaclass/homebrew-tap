class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v14.0.0.tar.gz"
  sha256 "3ab79f92af3d3b9830e1574bf9cdb5fe6cfacf3fb375f29f77d602c33a3d6297"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v14.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f910f4228893e2b22c14a8d798168edd1fc055820fcd45711ad6ee5b8dbaa374"
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
