class AddColumnIntegerId < ActiveRecord::Migration
	def change
		add_column :posts ,:integer_id, :integer
	end

end 