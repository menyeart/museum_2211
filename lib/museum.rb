class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    matches_array = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          matches_array << exhibit
        end
      end
    end
    matches_array
  end

  def admit(patron)
    @patrons << patron
  end


  def patrons_by_exhibit_interest
    exhibit_interest_hash = Hash.new { |h, k| h[k] = [] }
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if recommend_exhibits(patron).include?(exhibit) == true
          exhibit_interest_hash[exhibit] << patron
        else
          exhibit_interest_hash[exhibit] 
        end
      end
    end
    exhibit_interest_hash
  end

  def ticket_lottery_contestants(exhibit)
    lottery_contestant_list = []
    patrons_by_exhibit_interest[exhibit].each do |patron|
      if patron.spending_money < exhibit.cost
        lottery_contestant_list << patron
      end
    end
    lottery_contestant_list 
  end

  def draw_lottery_contestant(exhibit)
    ticket_lottery_contestants(exhibit).sample.name
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_contestant(exhibit)
    if winner == nil
      puts "No winners for this lottery"
    else
      puts "#{winner} has won the #{exhibit.name} exhibit lottery"
    end
  end
 





end