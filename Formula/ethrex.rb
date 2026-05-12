class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v10.0.0.tar.gz"
  sha256 "5428a023770fdc716768492269c7e31413543af0c6c2012f8b36687d102cacbd"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v10.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a0024c012d298d33539be92fc2b1398342260b27d6f4a4f69f9d70b8dc4b2dde"
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
