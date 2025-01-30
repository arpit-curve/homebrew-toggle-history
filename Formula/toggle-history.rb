class ToggleHistory < Formula
  desc "Interactive script to enable or disable command history tracking"
  homepage "https://github.com/arpit-curve/homebrew-toggle-history"
  url "https://github.com/arpit-curve/homebrew-toggle-history/archive/v1.0.0.tar.gz"
  sha256 "ccfa34795c994014aa10c5266c66061fdaef77d4efdcdd56376b0943ebad0d3c"
  license "MIT"

  def install
    bin.install "toggle_history.sh" => "toggle-history"
  end

  test do
    system "#{bin}/toggle-history", "--version"
  end
end
