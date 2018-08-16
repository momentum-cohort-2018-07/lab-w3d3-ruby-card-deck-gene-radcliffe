require_relative "card"
class Deck
    include Comparable
    attr_accessor :cards_left, :shuffled_deck
   

 

    def init_hash
      @DECK_HASH = {
      
      clubs: [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K],
      diamonds: [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K],
      hearts: [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K],
      spades: [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
      }
    
    end
    
    def init_deck
        @card_array=[]
        create_deck(@card_array)
        @cards_left = @card_array.length
        @card_counter =0
        @current_card=nil
        @shuffled_deck =[]
    end
    
    def initialize
    
      init_hash
      init_deck
      
    end

    def draw
        @current_card = get_card(@card_counter)
        delete_card(@card_counter)
        @card_counter += 1
        @current_card
    end
    def cards
        @card_array
    end

    def <=>(other)
        
    end
    def shuffle
        @shuffled_deck = @card_array.shuffle
        @shuffled_deck
    end

    def delete_card(index)
        @card_array.delete_at(index)
        @cards_left = @card_array.length
    end

    def find_card(card)
      index_of_card = @card_array.find_index(card)
      index_of_card
    end

    
    def get_card(index)
        @card_array[index]
    end

    private
    def create_deck(cards)
      card_array=cards
      @DECK_HASH.each do |k,v|
        v.each do |val|
          card_array.push(Card.new(val,k))
        end
      end
    end

end 