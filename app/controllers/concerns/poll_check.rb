module PollCheck
    def self.players(game)
        polls = game["poll"]
        poll_position = 0
        polls.each_with_index do |poll, i|
            poll_position = i if poll["name"] == "suggested_numplayers"
        end
        playervotes = polls[poll_position]["results"]
        playercounts = []
        upvotes = downvotes = 0
        playervotes.each do |playercount|
            playercount["result"].each do |result|
                upvotes = result["numvotes"] if (result["value"] == "Recommended") || (result["value"] == "Best")
                downvotes = result["numvotes"] if result["value"] == "Not Recommended"
            end
            playercounts.push(playercount["numplayers"]) if upvotes > downvotes
        end
        puts "#{playercounts} PLAYERS"
        return playercounts
  
    end
end
