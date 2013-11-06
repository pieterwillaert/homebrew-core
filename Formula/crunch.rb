require 'formula'

class Crunch < Formula
  homepage 'http://sourceforge.net/projects/crunch-wordlist'
  url 'http://sourceforge.net/projects/crunch-wordlist/files/crunch-wordlist/crunch-3.4.tgz'
  sha1 '2e73faa0f8f8a9a761c1f191e201d0be76f74491'

  def install
    inreplace "Makefile" do |s|
      s.change_make_var! "CC", ENV.cc
      s.change_make_var! "LFS", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
    end

    system "make"

    bin.install "crunch"
    man1.install "crunch.1"
    share.install Dir["*.lst"]
    prefix.install "GPL.txt"
  end
end
