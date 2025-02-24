class Nave < Formula
  desc "Virtual environments for Node.js"
  homepage "https://github.com/isaacs/nave"
  url "https://github.com/isaacs/nave/archive/refs/tags/v3.5.4.tar.gz"
  sha256 "6986eec520788e71696b62be6d1158bc9358659335a20deb9b969cbc537d0e0d"
  license "ISC"
  head "https://github.com/isaacs/nave.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0a384a370f3003cd572826d6f3c4d6d632390dfad819bd1b2c547dfed93db013"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0a384a370f3003cd572826d6f3c4d6d632390dfad819bd1b2c547dfed93db013"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0a384a370f3003cd572826d6f3c4d6d632390dfad819bd1b2c547dfed93db013"
    sha256 cellar: :any_skip_relocation, sonoma:        "3d72f53b87436b7c80c41f5577e7cb6528dde9487bfba6b2e5ca3393d4256625"
    sha256 cellar: :any_skip_relocation, ventura:       "3d72f53b87436b7c80c41f5577e7cb6528dde9487bfba6b2e5ca3393d4256625"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0a384a370f3003cd572826d6f3c4d6d632390dfad819bd1b2c547dfed93db013"
  end

  def install
    bin.install "nave.sh" => "nave"
  end

  test do
    assert_match "0.10.30", shell_output("#{bin}/nave ls-remote")
  end
end
