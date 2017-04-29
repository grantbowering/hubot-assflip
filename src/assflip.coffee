# Description
#   Replies to '[x]-ass [y]' with the hyphen moved to the other side ('[x] ASS-[y]?!')
#
# Commands:
#   I mercilessly flip your ass-hyphens.
#
# Author:
#   grant.bowering@gmail.com

module.exports = (robot) ->

  robot.hear ///
                (?:
                 (?:
                   (\w+)    # any word,
                   [-\x20]+ # with at least one space or dash,
                  )
                 |          # or 
                 (?:
                  (?:
                   (dumb|smart|dope|sweet|bad) #common words that don't get spaces or dashes
                   [-\x20]* # with an optional space or dash
                  )
                 )
                )   # any word (captured as [1])
                [-\x20]* # optional dashes or spaces could appear here, we don't really care if or how many
                ass      # the word 'ass'
                \x20     # a space
                (?!to|with|a|now|for|if|who|that|hole) # words that ruin it
                (\w+)    # any word not in the preceeding negative-lookahead (captured as [2])
            ///i, (msg) ->
    if (msg.match[1])
      verb = msg.match[1]
    if (msg.match[2])
      verb = msg.match[2]
    msg.send "#{verb} ASS-#{msg.match[3]}?!"
    