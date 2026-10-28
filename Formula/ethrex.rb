class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v30.0.1.tar.gz"
  sha256 "e69c1c9cf1536d5299716aa24a7639b94c15100d9fc3a8972403d736e6af489a"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v30.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d1207b959f174b8cab41270dc4df6a12adf470bde96b0d3946ddcc6bbce73d0c"
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
