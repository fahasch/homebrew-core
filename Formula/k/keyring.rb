class Keyring < Formula
  include Language::Python::Virtualenv

  desc "Easy way to access the system keyring service from python"
  homepage "https://github.com/jaraco/keyring"
  url "https://files.pythonhosted.org/packages/69/cd/889c6569a7e5e9524bc1e423fd2badd967c4a5dcd670c04c2eff92a9d397/keyring-24.3.0.tar.gz"
  sha256 "e730ecffd309658a08ee82535a3b5ec4b4c8669a9be11efb66249d8e0aeb9a25"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "036f54c565a93f9f0b909b69cd45ff1f72dfe81cc2876960d6a3fd905982d1f4"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "4613f7464bdbb9f507d0ad52d856ac09867053f54db651b82a6e3f60e83376df"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b59e21e3fc9edce1dc5aec35ccdef53d84e9afba9a5d02e76eade3aac190878c"
    sha256 cellar: :any_skip_relocation, sonoma:         "179dbca134482ef6704d5659448e5a94cf020b5b5524b2bcd49c6b953889bfdd"
    sha256 cellar: :any_skip_relocation, ventura:        "8744251e993d35ad520223cb0ef42c1c17e08c05c2f9eb478064dac88d8b3be3"
    sha256 cellar: :any_skip_relocation, monterey:       "6e4abd8454ae73eb8589945406fa20ae7ef6fae82d683a440f018b154c29f13f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e8a1500909e30e1a614a4a4127a53ea0503482d534a2bf28e0370803d6618192"
  end

  depends_on "python@3.12"

  on_linux do
    depends_on "python-cryptography"

    resource "jeepney" do
      url "https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf/jeepney-0.8.0.tar.gz"
      sha256 "5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806"
    end

    resource "secretstorage" do
      url "https://files.pythonhosted.org/packages/53/a4/f48c9d79cb507ed1373477dbceaba7401fd8a23af63b837fa61f1dcd3691/SecretStorage-3.3.3.tar.gz"
      sha256 "2403533ef369eca6d2ba81718576c5e0f564d5cca1b58f73a8b23e7d4eeebd77"
    end
  end

  resource "jaraco-classes" do
    url "https://files.pythonhosted.org/packages/a5/8a/ed955184b2ef9c1eef3aa800557051c7354e5f40a9efc9a46e38c3e6d237/jaraco.classes-3.3.1.tar.gz"
    sha256 "cb28a5ebda8bc47d8c8015307d93163464f9f2b91ab4006e09ff0ce07e8bfb30"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/df/ad/7905a7fd46ffb61d976133a4f47799388209e73cbc8c1253593335da88b4/more-itertools-10.2.0.tar.gz"
    sha256 "8fccb480c43d3e99a00087634c06dd02b0d50fbf088b380de5a41a015ec239e1"
  end

  resource "shtab" do
    url "https://files.pythonhosted.org/packages/18/95/5691f59ef352d45017863bb6082d3c046a7cee2672458b4aa1850a12904a/shtab-1.7.0.tar.gz"
    sha256 "6661c2835d0214e259ab74d09bdb9a863752e898bcf2e75ad8cf7ebd7c35bc7e"
  end

  def install
    virtualenv_install_with_resources

    generate_completions_from_executable(bin/"keyring", "--print-completion", shells: [:bash, :zsh])
  end

  test do
    assert_empty shell_output("#{bin}/keyring get https://example.com HomebrewTest2", 1)
  end
end
