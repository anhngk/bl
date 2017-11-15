module ApplicationHelper
	def true_false_converter(status, truthy: 'Active', falsey: 'Disabled')
		if status
			truthy
		else
			falsey
		end
	end
end
