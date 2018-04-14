#!/usr/bin/env ruby -e
### REVERSE-SEARCH ###
# We want to use a pure-Ruby readline.
# This has some trade-offs, but allows us to redefine the reverse-search.
gem 'rb-readline'
require 'readline'

# Our redefined reverse-search
def RbReadline.rl_reverse_search_history(sign, key)
  # Replace the contents of the current line with the one selected from fzf.
  line = `cat ~/.pry_history | fzf --tac --height=40% -n2..,.. -m`
  # Ideally, I'd love to leave the result the way it is, but readline doesn't offer us any flexibility when it comes to moving up and down.
  # So, we'll split the line, strip it of any newlines and spaces, then join the lines with a semi-colon.
  line = line.split("\n").map(&:strip).join("; ")

  # We can then replace the entire line.
  rl_replace_line line, false
  # Once the line has been replaced, refresh the display and move to the end of line.
  rl_refresh_line 0, 1
  rl_end_of_line  0, 1
end

