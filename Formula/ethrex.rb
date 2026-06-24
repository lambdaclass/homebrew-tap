class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v18.0.0.tar.gz"
  sha256 "f36c89fa2a28272fd9b994f8d20ccb7a90e8c37c399c099ba25cfe42d5d7bc65"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v18.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7a074f51c984b18429f3ab5fb7509e2308711111dbe6d0af244c75ea0be9818f"
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
