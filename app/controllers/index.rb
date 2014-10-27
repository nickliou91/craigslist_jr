require 'faker'
get '/' do
  # Look in app/views/index.erb
  @category = Category.all
  @post = Post.order("created_at DESC").limit(10)

  erb :index

end

get '/:category_name' do
@category = Category.all
@post = Post.where(category_id: Category.select("id").where(category_name: params[:category_name]))

erb :category
end


post '/:category_name/new_post' do 
	
	# params.each do |key, value|
	# 	raise ArgumentError.new if params[key] == ""
	# end
	@category = Category.all
	post = Post.new
	post.title = params[:title]
	post.description=params[:message]
	post.location =  Faker::Address.state
	post.image_link = "/images/Motivational-Quote-Image.jpg"
	post.author = params[:author]
	post.category_id = Category.find_by(category_name: params[:category_name]).id
	post.generate_edit_key
	@key = post.edit_key
	
	redirect "posts/#{post.id}"
	# rescue ArgumentError
	# 	@error = "Form Incomplete"
	# 	erb :error
	# end 
end 

get '/posts/:id' do 
	@category = Category.all
	@post = Post.find(params[:id])
	erb :single_post

end 

get '/:id/edit' do
	@category = Category.all
	# @post = Post.find_by(edit_key: params[:key])
		@post = Post.find(params[:id])
		erb :edit_post
end 

post '/:id' do 
	@post = Post.find(params[:id])
	if @post.update(params[:post])
		redirect "posts/#{@post.id}"
	else
		@category = Category.all
		erb :edit_post
	end	

end

delete '/posts/:id' do
	@post =Post.find(params[:id])
	category_name = @post.category.category_name
  Post.find(params[:id]).destroy
  redirect "/#{category_name}"
end
