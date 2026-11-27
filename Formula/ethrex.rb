class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v31.0.0.tar.gz"
  sha256 "9762797a5ba1b0b8350f3c19d5c30bc1af2449a4839b16011706c3ac806129da"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v31.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "df304fcdafb229cc164a4553bb8ab08b959b63dbb098409c9a3dbd0c268fda05"
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
