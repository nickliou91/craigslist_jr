class RenameColumnName <ActiveRecord::Migration
	def change
		rename_column :posts, :integer_id, :category_id
	end

end
