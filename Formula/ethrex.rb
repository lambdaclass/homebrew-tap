class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "bd5bca1a7ce4b0e24b738dcd459f4329250a56659e73566c673648e156cd18b3"
  license "Apache-2.0"

  depends_on "rustup" => :build

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v7.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "93ab1d735c1f1661cf32644015567a5cb8a782eee0ccb09ffd471df10a4ebb5c"
  end

#   on_macos do
#     if Hardware::CPU.arm?
#       url "https://github.com/lambdaclass/homebrew-tap/releases/download/v1.0.1/ethrex-v1.0.1-aarch64-apple-darwin.tar.gz"
#       sha256 "db6a82de601e785a1224e8f05f6586a97c0c2bacd4abb1c1c03f64623c1a2536"
#     end
#   end
# 
#   on_linux do
#     if Hardware::CPU.arm?
#       url "https://github.com/lambdaclass/homebrew-tap/releases/download/v1.0.1/ethrex-v1.0.1-aarch64-unknown-linux-gnu.tar.gz"
#       sha256 "c3b7051834e406b2312164d8f8844630a4d3719bd251f6c9ee61537a7276379b"
#     else
#       url "https://github.com/lambdaclass/homebrew-tap/releases/download/v1.0.1/ethrex-v1.0.1-x86_64-unknown-linux-gnu.tar.gz"
#       sha256 "810ece2ae12976d4aa97c8080ebc68bd2abeca3d6321958f4ee0f26e7b9ad2c0"
#     end
#   end
    

  def install
    system "rustup", "toolchain", "install", "1.90"
    system "cargo", "install", *std_cargo_args(path: "cmd/ethrex")
  end

  # test do
  #   assert_match "ethrex", shell_output("#{bin}/ethrex --version")
  # end
end
