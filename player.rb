class Player
  def initialize
    @hand =[]
    @pairs = []
  end

  #Is there a better way to solve this?
  def display_hand
    display_hand = []
    @hand.each do |h|
      display_hand << "#{create_hand(h)}"
    end
    display_hand
  end

  #Is there a better way to solve this?
  def display_pairs
    @display_pairs = []
    pairs.each do |pair|
      i = 0
      result = ""
      while i < pair.count
        result << "#{create_hand(pair[i])}"
        result << ' and ' if i != (pair.count - 1)
        i += 1
      end
      @display_pairs << result if result != ""
    end
    @display_pairs
  end

  attr_accessor :hand, :pairs

  def create_hand(hand)
    "#{hand.rank}#{hand.suit}"
  end
end
