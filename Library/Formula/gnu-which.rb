class GnuWhich < Formula
  # Previous homepage is dead. Have linked to the GNU Projects page for now.
  homepage "https://savannah.gnu.org/projects/which/"
  url "http://ftpmirror.gnu.org/which/which-2.21.tar.gz"
  mirror "https://ftp.gnu.org/gnu/which/which-2.21.tar.gz"
  sha256 "f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad"

  bottle do
    cellar :any
    sha1 "567d232b6ad4221f446d2862a8f9e230d0a51eba" => :yosemite
    sha1 "18afa8a2d0e56b74c0d22a02dd24b46635d2e14b" => :mavericks
    sha1 "705c8aa57e1f67b7e9d61c36088902f0562aa2bf" => :mountain_lion
  end

  deprecated_option "default-names" => "with-default-names"

  option "with-default-names", "Do not prepend 'g' to the binary"

  def install
    args = ["--prefix=#{prefix}", "--disable-dependency-tracking"]
    args << "--program-prefix=g" if build.without? "default-names"

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/gwhich", "gcc"
  end
end
