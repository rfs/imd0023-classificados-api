Pheromone::API.resource :users do
  params do
    requires :email, type: String
    requires :name, type: String
    requires :phone, type: String
    optional :avatar, type: String
  end
  post do
    user = User.new(email: params[:email], name: params[:name], phone: params[:phone])
    if not user.save
      status 422
      {errors: user.errors}
    end
  end

  params do
    requires :user_email, type: String
    requires :email, type: String
    requires :name, type: String
    requires :phone, type: String
    optional :avatar, type: String
  end
  put do
    user = User.find_by(email: params[:user_email])
    user.email = params[:email]
    user.name = params[:name]
    user.phone = params[:phone]
    user.avatar = params[:avatar]
    if not user.save
      status 422
      {errors: user.errors}
    end
  end
end
