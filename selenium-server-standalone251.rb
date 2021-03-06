
class SeleniumServerStandalone251 < Formula
  desc "Automated Browser Control"
  homepage "http://seleniumhq.org/"
  url "https://selenium-release.storage.googleapis.com/2.51/selenium-server-standalone-2.51.0.jar"
  sha256 "919752369eae7ae8fd391eb5d50c88830cf21c0ea2e01cd50e7beb7fceb48991"

  conflicts_with "selenium-server-standalone", :because => "Differing version of core formula"

  def install
    libexec.install "selenium-server-standalone-2.51.0.jar"
    bin.write_jar_script libexec/"selenium-server-standalone-2.51.0.jar", "selenium-server"
  end

  plist_options :manual => "selenium-server -p 4444"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/java</string>
        <string>-jar</string>
        <string>#{libexec}/selenium-server-standalone-2.51.0.jar</string>
        <string>-port</string>
        <string>4444</string>
      </array>
      <key>ServiceDescription</key>
      <string>Selenium Server</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/selenium-error.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/selenium-output.log</string>
    </dict>
    </plist>
  EOS
  end
end
