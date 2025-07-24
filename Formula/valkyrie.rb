class Valkyrie < Formula
  desc "A CLI tool to convert SVG/XML into Compose ImageVector"
  homepage "https://github.com/ComposeGears/Valkyrie"
  url "https://github.com/ComposeGears/Valkyrie/releases/download/0.16.0/valkyrie-cli-0.16.0.zip"
  version "0.16.0"
  sha256 "c44b66f87187a95d4c2bd03189d68a5d52779006762eac70d19c983588a4d580"

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