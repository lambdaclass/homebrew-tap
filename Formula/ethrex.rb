class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v17.0.0.tar.gz"
  sha256 "12dbc06b808921cedfdc12b1b43bc7b1bb78abc38475f41c21884cebfb51b275"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v17.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ce03e7f0cbaf2586684dc59e7e65905594b5eed5ba01d2aa221d20c44eb82c75"
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
