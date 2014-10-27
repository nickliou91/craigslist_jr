require 'faker'
class Seed

	def self.populate_data_into_categories

		categories_array = ["Automotive", "Car", "Computer", "Real Estate"]
		categories_array.each do |category|

			Category.create(category_name: "#{category}")
		end
	end

	def self.populate_data_into_posts
		20.times do 
			post = Post.new
			post.title = Faker::Lorem.sentence(7)
			post.description = Faker::Lorem.sentence(40)
			post.location = Faker::Address.state
			post.image_link = "/images/Motivational-Quote-Image.jpg"
			post.author = Faker::Name.name
			random_category_id = Random.new
			post.category_id = random_category_id.rand(9..12)
			post.save!
		end
	end
end 

# Seed.populate_data_into_categories
Seed.populate_data_into_posts
