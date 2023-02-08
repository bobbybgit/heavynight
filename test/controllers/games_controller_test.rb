require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { bgg_id: @game.bgg_id, description: @game.description, image: @game.image, max_player_count: @game.max_player_count, max_rec_player_count: @game.max_rec_player_count, min_player_count: @game.min_player_count, min_rec_player_count: @game.min_rec_player_count, rating: @game.rating, user_id: @game.user_id, venue_id: @game.venue_id, weight: @game.weight } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { bgg_id: @game.bgg_id, description: @game.description, image: @game.image, max_player_count: @game.max_player_count, max_rec_player_count: @game.max_rec_player_count, min_player_count: @game.min_player_count, min_rec_player_count: @game.min_rec_player_count, rating: @game.rating, user_id: @game.user_id, venue_id: @game.venue_id, weight: @game.weight } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end
end
