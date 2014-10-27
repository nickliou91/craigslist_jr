class Post < ActiveRecord::Base

	belongs_to :category

	def generate_edit_key
		begin 
			key = (0...8).map{ (65 + rand(26)).chr}.join
		end until key_unique(key)
		self.edit_key = key
		save
	end

	def key_unique(key)
		Post.where(edit_key: key).count == 0
	end


end