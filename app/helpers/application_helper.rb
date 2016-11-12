module ApplicationHelper
	def full_title(pageTitle = '')
		baseTitle = "Invasion"
		if pageTitle.empty?
			baseTitle
		else
			pageTitle + " | " + baseTitle
		end
	end

	def header(controller = 'foo', action = 'bar')
		if controller == "static_pages" && action == "game"
			render 'layouts/game_header'
		else
			render 'layouts/header'
		end
	end
end
