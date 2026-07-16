# Homebrew cask TEMPLATE for the MaulTeam Mac app (distribution channel ③).
#
# This file is the source of truth. It is NOT a live cask on its own — the
# 2.0.1 / 78af5038e33794df7da75970bbc03e5e0ed57fd750ea51f52e70b53f9950d4cb placeholders are rendered by macapp/scripts/bump-tap.sh
# on each Release publish and the result is pushed to the tap repo
# (sohei56/homebrew-tap) as Casks/maul-team.rb. End users install with:
#
#   brew tap sohei56/homebrew-tap
#   brew install --cask maul-team
#
cask "maul-team" do
  version "2.0.1"
  sha256 "78af5038e33794df7da75970bbc03e5e0ed57fd750ea51f52e70b53f9950d4cb"

  url "https://github.com/sohei56/maul-team/releases/download/v#{version}/MaulTeam-#{version}.dmg"
  name "Maul Team for Claude Code"
  desc "Native macOS app that runs a multi-agent Claude Code Scrum team"
  homepage "https://github.com/sohei56/maul-team"

  # Matches LSMinimumSystemVersion (14.0) in make-app.sh's Info.plist.
  depends_on macos: :sonoma

  app "MaulTeam.app"

  # The app shells out to these at runtime. Homebrew can't install Claude Code
  # (separate distribution), so surface the prerequisites as caveats rather than
  # failing the install.
  caveats <<~EOS
    MaulTeam.app drives the `claude` CLI inside a terminal pane. You also need:
      • Claude Code  >= 2.1.172   https://claude.com/claude-code
      • Python       >= 3.9       (dashboard — check: python3 --version)
      • tmux and git on your PATH
  EOS

  zap trash: [
    "~/Library/Application Support/MaulTeam",
  ]
end
