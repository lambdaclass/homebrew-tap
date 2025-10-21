class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "b84caf50fb455b4c53852607591977a398d6632265fc81c867aee1f6ba8917b6"
  license "Apache-2.0"

  depends_on "rustup" => :build

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v5.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ef8e1f5a672b5a883acbab5b227a21c8397b31c59b93a561bd8adc185a624eb5"
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
