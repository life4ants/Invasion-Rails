module ApplicationHelper
	def full_title(pageTitle = '')
		baseTitle = "Invasion"
		if pageTitle.empty?
			baseTitle
		else
			pageTitle + " | " + baseTitle
		end
	end
	def header(controller, action)
		if controller == "games" && action == "play"
			render 'layouts/game_header'
		else
			render 'layouts/header'
		end
	end
end
