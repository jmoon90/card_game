class Deck
  def new_deck
    deck.shuffle
  end

  private

  def suit
    ["H", "D", "S", "C"]
  end

  def cards
    ["A", "K", "Q", "J" , 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def deck
    deck = []
    cards.each do |card|
      suit.length.times do |i|
        deck << Cards.new(card, suit[i])
      end
    end
    deck
  end
end
