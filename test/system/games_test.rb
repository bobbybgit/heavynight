require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Bgg", with: @game.bgg_id
    fill_in "Description", with: @game.description
    fill_in "Image", with: @game.image
    fill_in "Max player count", with: @game.max_player_count
    fill_in "Max rec player count", with: @game.max_rec_player_count
    fill_in "Min player count", with: @game.min_player_count
    fill_in "Min rec player count", with: @game.min_rec_player_count
    fill_in "Rating", with: @game.rating
    fill_in "User", with: @game.user_id
    fill_in "Venue", with: @game.venue_id
    fill_in "Weight", with: @game.weight
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Bgg", with: @game.bgg_id
    fill_in "Description", with: @game.description
    fill_in "Image", with: @game.image
    fill_in "Max player count", with: @game.max_player_count
    fill_in "Max rec player count", with: @game.max_rec_player_count
    fill_in "Min player count", with: @game.min_player_count
    fill_in "Min rec player count", with: @game.min_rec_player_count
    fill_in "Rating", with: @game.rating
    fill_in "User", with: @game.user_id
    fill_in "Venue", with: @game.venue_id
    fill_in "Weight", with: @game.weight
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
