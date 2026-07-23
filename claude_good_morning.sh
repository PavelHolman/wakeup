#!/bin/bash

# 1. Expose common installation directories so cron can find the 'claude' command
export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/.npm-global/bin:$PATH"

# 2. Define the log file location
LOG_FILE="/tmp/claude_good_morning.log"

# 3. Add a timestamp header so you know exactly when it fired
echo "=== Wake up triggered: $(date) ===" >> "$LOG_FILE"

# 4. Run the menu-fetch + Discord-post script, redirecting output and errors (2>&1) to the log
# Pinned to this interpreter because the PATH above puts Homebrew's python3 first, which lacks the pip packages installed below.
PYTHON_BIN="/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$PYTHON_BIN" "$SCRIPT_DIR/claude_good_morning.py" >> "$LOG_FILE" 2>&1

# 5. Add a blank line for readability between days
echo "" >> "$LOG_FILE"
