class Game
  def initialize(deck, players)
    @players = players
    @deck = deck
  end

  def display_pairs
    @players.each_with_index do |player, i|
      check_for_pairs(player)
      puts "Player #{i + 1} Pairs: #{player.display_pairs}"
    end
  end

  def display_player_hands
    @players.each_with_index do |player, i|
      puts "player #{i + 1} has #{player.display_hand}"
    end
  end

  def display_community_cards
    display_hand = []
    community_cards.each do |h|
      display_hand << "#{h.rank}#{h.suit}"
    end
    display_hand
  end

  attr_accessor :deck

  private

  def check_for_pairs(player)
    check_player_hand_against_self(player)
    check_player_hand_against_community(player)
    check_community_hand_against_community(player)
  end

  def community_cards
    @community_cards ||= next_five_cards
  end

  def check_player_hand_against_self(player)
    player.pairs << [player.hand[0], player.hand[1]] if player.hand[0].rank ==  player.hand[1].rank
  end

  def check_player_hand_against_community(player)
    player.hand.each do |hand|
      community_cards.each do |card|
        if hand.rank == card.rank
          player.pairs << [hand,card]
        end
      end
    end
  end

  def check_community_hand_against_community(player)
    pairs = []
    card_count = (community_cards.count - 1)
    community_cards.each_with_index do |card,cards_i|
      i = 0
      paired = []
      while i < card_count
        if card.rank == community_cards[i + 1].rank && card != community_cards[i + 1]
          paired << card if !paired.include?(card)
          paired << community_cards[i + 1]
        end
        i += 1
        card_count -= 1
      end
      pairs << paired
    end
    player.pairs << pairs.flatten
  end

  def next_five_cards
    @card = []
    5.times do
      @card << @deck.shift
    end
    @card
  end
end
