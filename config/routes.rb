Rails.application.routes.draw do
  match ':controller(/:action(/:id))', via: [ :get, :post, :patch ]

  namespace :authentication do
  	post 'sign_in' => 'sign_in#sign_in'
	post 'sign_up' => 'sign_up#sign_up'
  end
 
  namespace :timeline do
  	post 'show' => 'timeline#show_timeline'
	post 'show/reply' => 'timeline#show_reply'
	post 'show/mypost' => 'timeline#show_mypost'
	post 'show/myfavorite' => 'timeline#show_myfavorite'
  	post 'show/geography' => 'timeline#show_geography'
  	post 'favorite/add' => 'response#favorite_add'
	post 'favorite/subtract' => 'response#favorite_subtract'
	post 'retweet/add' => 'response#retweet_add'
	post 'retweet/subtract' => 'response#retweet_subtract'
  end

  namespace :post do
  	post 'without' => 'post#upload'
	post 'with' => 'post#upload_with_image'
	get 'download/image' => 'post#download_image'
  end

  namespace :account do
	post 'show/myself' => 'account#show_myself'
	post 'show/following' => 'account#show_following'
  	post 'show/follower' => 'account#show_follower'
  	post 'following/add' => 'relationship#following_add'
	post 'following/subtract' => 'relationship#following_subtract'
  end

end
