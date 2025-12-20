cask "vietnamese-ime" do
  version "1.0.1"
  sha256 "bbe44e7b818d04eb5eecb6a9933d4cb3fb3133d4435bf854f0741f641ca11ba5"

  url "https://github.com/nihmtaho/vietnamese-ime/releases/download/v1.0.1/VietnameseIME-1.0.1-unsigned.dmg"
  name "Vietnamese IME"
  desc "Fast Vietnamese input method editor for macOS"
  homepage "https://github.com/YOURUSERNAME/vietnamese-ime"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "VietnameseIMEFast.app"

  postflight do
    puts ""
    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    puts "  Vietnamese IME v1.0.1 installed successfully!"
    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    puts ""
    puts "⚠️  IMPORTANT: Gatekeeper Bypass Required"
    puts ""
    puts "This app is not code-signed. You need to bypass Gatekeeper:"
    puts ""
    puts "Option 1: Remove quarantine (Recommended)"
    puts "  xattr -cr /Applications/VietnameseIMEFast.app"
    puts ""
    puts "Option 2: Right-click Open"
    puts "  1. Go to Applications folder"
    puts "  2. Right-click on VietnameseIMEFast.app"
    puts "  3. Select 'Open' from menu"
    puts "  4. Click 'Open' in dialog"
    puts ""
    puts "After bypassing Gatekeeper:"
    puts "  • Grant Accessibility permission when prompted"
    puts "  • Menu bar icon will appear (🇻🇳)"
    puts "  • Click icon to toggle Vietnamese/English"
    puts "  • Or use: Cmd+Shift+V"
    puts ""
    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  end

  uninstall quit: "com.vietnamese.ime"

  zap trash: [
    "~/Library/Logs/VietnameseIME",
    "~/Library/Preferences/com.vietnamese.ime.plist",
    "~/Library/Caches/com.vietnamese.ime",
  ]

  caveats <<~EOS
    Vietnamese IME requires Accessibility permission to function.
    
    System Preferences → Security & Privacy → Privacy → Accessibility
    
    Add Vietnamese IME to the list and enable it.
  EOS
end
