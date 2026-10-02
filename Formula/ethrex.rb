class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v29.0.0.tar.gz"
  sha256 "5ef7bf373d3ee46153c495e43507b0960ad82dee77cee6629e676f18d5f4eb6d"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v29.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bed0c49e8bd2c985ae6d950e555bfaba9e7187d49bd9afb9687e442a189fdcc3"
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
