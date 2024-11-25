class Valkyrie < Formula
  desc "A CLI tool to convert SVG/XML into Compose ImageVector"
  homepage "https://github.com/ComposeGears/Valkyrie"
  url "https://github.com/ComposeGears/Valkyrie/releases/download/0.11.0/valkyrie-cli-0.11.0.zip"
  version "0.11.0"
  sha256 "97f83aec423a0d00d47bb9db8ddac8f6040838c565c1355143d85d233c9c231f"

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