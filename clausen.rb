# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
class Clausen < Formula
  desc "Clausen function implementation"
  homepage "https://github.com/alextsui05/clausen"
  url "https://github.com/alextsui05/clausen/archive/v1.0.tar.gz"
  version "1.0"
  sha256 "b2848a6edf2188ad867616bd33bc6486ef44ee751cbbb80a4ca8c28b7defc5a9"

  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system bin/"eval_clausen"
  end
end
