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




end