class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v21.0.0.tar.gz"
  sha256 "bab485de88e9653eba8c8f2f1bc9069a8af178450035f760fe3f3a8ea1bd20f6"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v21.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "73245ba08d1c637ca433fd34b50c5b84aeb72d8e0cb0ce26e6aa6ffcd95bf800"
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
