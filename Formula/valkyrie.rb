class Valkyrie < Formula
  desc "A CLI tool to convert SVG/XML into Compose ImageVector"
  homepage "https://github.com/ComposeGears/Valkyrie"
  url "https://github.com/ComposeGears/Valkyrie/releases/download/cli-1.2.1/valkyrie-cli-1.2.1.zip"
  version "1.2.1"
  sha256 "5929fb15395059e566c51dcdb2bed98a2d2e92ad8d344f8186d3b701be6533b3"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"valkyrie").write_env_script libexec/"bin/valkyrie",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/valkyrie --help")
    assert_includes output, "Usage: valkyrie"
  end
end