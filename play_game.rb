require 'byebug'
require_relative 'deck'
require_relative 'player'
require_relative 'cards'
require_relative 'game'

class PlayGame
  def initialize(number_of_players)
    @number_of_players = number_of_players
    @total_hands = @number_of_players * 2
    @players = []
  end

  def start_game
    create_players
    deals_hand
    puts "community_cards: #{game.display_community_cards}"
    game.display_pairs
  end

  private

  def deals_hand
    2.times do
      @players.each do |player|
        player.hand <<  game.deck.shift
      end
    end

    game.display_player_hands
  end

  def create_players
    @number_of_players.times do
      @players << Player.new
    end
  end

  def game
    @game ||= Game.new(Deck.new.new_deck, @players)
  end
end

@play_game = PlayGame.new(3).start_game
