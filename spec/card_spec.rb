require 'card'

describe Card do

  def card(params = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end

  it 'has a suit' do
    raise unless card(suit: :spades).suit == :spades
  end

  it 'has a rank' do
    raise unless card(rank: 4).rank == 4
  end

  it 'is equal to itself' do
    subject = card(suit: :spades, rank: 4)
    other   = card(suit: :spades, rank: 4)

    raise unless subject == other
  end

  it 'is not equal to a card of differing suit' do
    subject = card(suit: :spades, rank: 4)
    other = card(suit: :hearts, rank: 4)

    raise unless subject != other
  end

  it 'is not equal to a card of differing rank' do
    subject = card(suit: :spades, rank: 4)
    other   = card(suit: :spades, rank: 5)

    raise unless subject != other
  end

  describe 'a jack' do
    it 'ranks higher than a 10' do
      Lower = card(rank: 10)
      Higher = card(rank: :jack)

      raise unless Higher.rank > Lower.rank
    end
  end

  describe 'a queen' do
    it 'ranks higher than a jack' do
      Lower = card(rank: :jack)
      Higher = card(rank: :queen)

      raise unless Higher.rank > Lower.rank
    end
  end

  describe 'a king' do
    it 'ranks higher than a queen' do
      Lower = card(rank: :queen)
      Higher = card(rank: :king)

      raise unless Higher.rank > Lower.rank
    end
  end
end
