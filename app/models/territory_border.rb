class TerritoryBorder < ActiveRecord::Base
	serialize :borders

  def canFight?(country2)
    country1 = self[:borders]
    country1.each do |border|
      if border == (country2)
        return true
      end
    end
    return false
  end
end
