get '/' do
  @posts = Post.all.sort
  erb :index
end

get '/comments/post/:post_id' do
  @post = Post.find(params[:post_id])
  erb :comments
end

post '/comments/post/:post_id' do
  @post = Post.find(params[:post_id])
  comment = Comment.create(content: params[:content], user_id: session[:user_id])
  @post.comments << comment
  erb :comments
end

get '/create' do
  erb :create
end

post '/create' do
  params[:user_id] = session[:user_id]
  Post.create(params)
  redirect ('/')
end

get '/sign-in' do
  erb :sign_in
end

post '/sign-in' do
  user = User.authenticate(params)
  if user != nil
    session[:user_id] = user.id
    redirect ('/')
  else
    redirect ('/sign-in')
  end
end

post '/sign-up' do
  user = User.create(params)
  session[:user_id] = user.id
  redirect ("/profile/#{user.id}")
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  erb :profile
end

post '/profile/:user_id' do
  @user = User.find(params[:user_id])
  @user.update(about: params[:about], email: params[:email])
  erb :profile
end

get '/submissions/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts.sort
  erb :index
end

get '/comments/:user_id' do
  @user = User.find(params[:user_id])
  @comments = @user.comments.sort
  erb :comments_by_user
end

post '/sign-out' do
  session.clear
  redirect ('/')
end






