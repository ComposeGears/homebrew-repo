class Valkyrie < Formula
  desc "A CLI tool to convert SVG/XML into Compose ImageVector"
  homepage "https://github.com/ComposeGears/Valkyrie"
  url "https://github.com/ComposeGears/Valkyrie/releases/download/0.17.3/valkyrie-cli-0.17.3.zip"
  version "0.17.3"
  sha256 "d186357e8bbc97b4ea4922aeda42d5850b531da8926163dafc746c4c96909536"

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