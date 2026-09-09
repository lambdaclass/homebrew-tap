class Ethrex < Formula
  desc "Minimalist, fast and modular implementation of the Ethereum protocol in Rust"
  homepage "https://docs.ethrex.xyz/"
  url "https://github.com/lambdaclass/ethrex/archive/refs/tags/v26.0.0.tar.gz"
  sha256 "aa9a876a5c39ffba3cc2adce3acae341c1fee751b09b5d7455ca8351d54a27a6"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v([0-9]+\.[0-9]+\.[0-9]+)$/i)
  end

  bottle do
    root_url "https://github.com/lambdaclass/homebrew-tap/releases/download/v26.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5acc26abd50af2a4eacad199bc072ced453587e077f4437cf4945aada8351002"
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
