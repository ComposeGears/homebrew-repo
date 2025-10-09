class Valkyrie < Formula
  desc "A CLI tool to convert SVG/XML into Compose ImageVector"
  homepage "https://github.com/ComposeGears/Valkyrie"
  url "https://github.com/ComposeGears/Valkyrie/releases/download/0.17.1/valkyrie-cli-0.17.1.zip"
  version "0.17.1"
  sha256 "58150169557e4fe72200c96c16d545eb8e2602e3e6481321c239425a19d209f5"

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