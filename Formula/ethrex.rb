class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v27.0.0.tar.gz"
  sha256 "653a96ef2772888c0003117181724ec01f96b6db2e60e90e9948d6d3f642f417"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v27.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "184aebc06822cd54f91b8bc309e119b4020f61ebbb7362d32c0fbc32ca3b1119"
  end

  depends_on "rustup" => :build

  on_linux do
    # `reqwest` pulls in `native-tls`, which is backed by OpenSSL on Linux.
    # `openssl-sys` locates it through `pkg-config`, so both the tool and the
    # keg have to be declared for `PKG_CONFIG_PATH` to point at `openssl.pc`.
    # macOS needs neither: there `native-tls` uses Security.framework.
    depends_on "pkgconf" => :build
    depends_on "openssl@3"
  end

  def install
    system "rustup", "toolchain", "install", "1.93"
    system "cargo", "install", *std_cargo_args(path: "cmd/ethrex")
  end

  test do
    assert_match "ethrex/v#{version}", shell_output("#{bin}/ethrex --version")
  end
end
