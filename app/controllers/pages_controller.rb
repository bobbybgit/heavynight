class PagesController < ApplicationController
    def dashboard
    end

    def loading
    end

    def dash_groups
        @groups = User.find_by(id:current_user.id).groups
    end

    def dash_games
        @my_games = Game.all.mine(current_user.id).owned_by_me
        @my_rated_games = Game.all.mine(current_user.id).rated_by_me 
        game_ids = @my_games.sort { |a,b| a.name <=> b.name }.map(&:bgg_id)
        @games = BggApi.thing({id:"#{game_ids[0]},#{game_ids}"})["item"]

    end

    def dash_events
    end

end