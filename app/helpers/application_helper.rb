module ApplicationHelper
	def true_false_converter(status, truthy: 'Active', falsey: 'Disabled')
		if status
			truthy
		else
			falsey
		end
	end

	def active_category(link_path)
		current_page?(link_path) ? "active-category" : ""
	end
end
