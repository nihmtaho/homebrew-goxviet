cask "goxviet" do
  version "1.2.3"
  sha256 "1a7fcf4fb327b9ee3daa14d8999641591ad21a2f008a608a33c6dda73a91e580"

  url "https://github.com/nihmtaho/goxviet-ime/releases/download/v1.2.3/GoxViet-1.2.3-unsigned.dmg"
  name "Gõ Việt (GoxViet)"
  desc "Fast Vietnamese input method editor for macOS"
  homepage "https://github.com/YOURUSERNAME/goxviet"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "goxviet.app"

  postflight do
    puts ""
    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    puts "  Gõ Việt (GoxViet) v1.2.3 installed successfully!"
    puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    puts ""
    puts "⚠️  IMPORTANT: Gatekeeper Bypass Required"
    puts ""
    puts "This app is not code-signed. You need to bypass Gatekeeper:"
    puts ""
    puts "Option 1: Remove quarantine (Recommended)"
    puts "  xattr -cr /Applications/goxviet.app"
    puts ""
    puts "Option 2: Right-click Open"
    puts "  1. Go to Applications folder"
    puts "  2. Right-click on goxviet.app"
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
    "~/Library/Logs/GoxViet",
    "~/Library/Preferences/com.vietnamese.ime.plist",
    "~/Library/Caches/com.vietnamese.ime",
  ]

  caveats <<~EOS
    Gõ Việt (GoxViet) requires Accessibility permission to function.
    
    System Preferences → Security & Privacy → Privacy → Accessibility
    
    Add Gõ Việt (GoxViet) to the list and enable it.
  EOS
end
