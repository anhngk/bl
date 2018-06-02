class ThongKe < ActiveRecord::Base

	def last_value
		values.last
	end

end