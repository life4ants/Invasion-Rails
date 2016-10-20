module ApplicationHelper
	def full_title(pageTitle = '')
		baseTitle = "Andy's App"
		if pageTitle.empty?
			baseTitle
		else
			pageTitle + " | " + baseTitle
		end
	end
end
