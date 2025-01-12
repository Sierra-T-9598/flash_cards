class Round
  attr_accessor :deck, :turns, :store_correct, :store_correct_by_category,
  :total_in_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @store_correct = []
    @store_correct_by_category = []
    @total_in_category = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    #takes a string as a guess
    #create a new Turn object with aprropriate guess and Card
    #store turn
    #return turn
    #move Round to next card in the deck
    turn = Turn.new(guess, current_card)
    turns << turn
    total_in_category << current_card

    if turn.correct?
      store_correct << guess
      store_correct_by_category << current_card
    end
    deck.cards.shift
    turns
  end

  def number_correct
    store_correct.length
  end

  def number_correct_by_category(category)
    store_correct_by_category.count do |card|
      card.category == category
    end
  end

  def percent_correct
    number_correct.to_f/turns.length.to_f * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f/
    total_in_category.count {|card| card.category == category}.to_f * 100
  end
end
