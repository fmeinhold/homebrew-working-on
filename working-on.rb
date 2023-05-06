class WorkingOn < Formula
  desc "CLI for tracking your time with toggl"
  homepage "https://github.com/fmeinhold/working-on"

  # Source code archive. Each tagged release will have one
  url "https://github.com/fmeinhold/working-on/archive/refs/tags/0.1.tar.gz"
  sha256 "896f480cc38d9b99adfdfb84a814f966d3a2e2495f8bdf36e77227ecc072079c"
  head "https://github.com/fmeinhold/working-on"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/fmeinold/working-on"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/kevinburke/hostsfile
    bin_path.install Dir["*"]
    cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "build", "-o", bin/"wo", "."
    end
  end

  # Homebrew requires tests.
  test do
    system bin/"wo", "--help"
  end
end
