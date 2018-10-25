class Pgformatter < Formula
  desc "PostgreSQL syntax beautifier"
  homepage "https://sqlformat.darold.net/"
  url "https://github.com/darold/pgFormatter/archive/v3.2.tar.gz"
  sha256 "c378af65561d6a5a985a5dd710d826cae84bef3c0f4db099037531bd9d108651"

  bottle do
    cellar :any_skip_relocation
    sha256 "49a1d10f2c41bcb00deed92ccd765ca7832c9c2758a8e04e8f5f13227012d251" => :mojave
    sha256 "c1f0fcb81b94ec4aa97a90a7110e793be409a9b44aea402989b5fbc61a133ce1" => :high_sierra
    sha256 "c1f0fcb81b94ec4aa97a90a7110e793be409a9b44aea402989b5fbc61a133ce1" => :sierra
    sha256 "c1f0fcb81b94ec4aa97a90a7110e793be409a9b44aea402989b5fbc61a133ce1" => :el_capitan
  end

  def install
    system "perl", "Makefile.PL", "DESTDIR=."
    system "make", "install"

    prefix.install (buildpath/"usr/local").children
    (libexec/"lib").install "blib/lib/pgFormatter"
    libexec.install bin/"pg_format"
    bin.install_symlink libexec/"pg_format"
  end

  test do
    test_file = (testpath/"test.sql")
    test_file.write("SELECT * FROM foo")
    system "#{bin}/pg_format", test_file
  end
end
