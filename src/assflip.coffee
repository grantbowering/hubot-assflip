# Description
#   Replies to '<word>-ass <word>'  with the hyphen moved to the other side ('Eww, <word> ASS-<noun>?!')
#
# Commands:
#   I mercilessly flip your ass-hyphens.
#
# Author:
#   grant.bowering@gmail.com

module.exports = (robot) ->

  robot.hear ///
                (\w+)    # any word (captured as [1])
                [-\x20]* # optional dashes or spaces could appear here, we don't really care if or how many
                ass      # the word 'ass'
                \x20     # a space
                (?!to|with|a|now|for|if|who|that|hole) # words that ruin it
                (\w+)    # any word not in the preceeding negative-lookahead (captured as [2])
            ///i, (msg) ->
    msg.send "Eww, #{msg.match[1]} ASS-#{msg.match[2]}?!"