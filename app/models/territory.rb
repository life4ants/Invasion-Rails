class Territory < ActiveRecord::Base
	serialize :borders

	def canFight?(country2)
		country1 = self[:borders]
		country1.each do |n|
			if n == (country2-1)
				return true
			end
		end
		return false
	end
end
