Pheromone::API.resource :items do
  params do
    requires :user_email, type: String
  end
  get do
    present User.find_by(email: params[:user_email]).items
  end

  params do
    requires :user_email, type: String
    requires :title, type: String
    requires :description, type: String
    requires :value, type: Float
    requires :selling, type: String
    optional :photo, type: String
  end
  post do
    item = Item.new(
      user: User.find_by(email: params[:user_email]),
      title: params[:title],
      description: params[:description],
      value: params[:value],
      selling: params[:selling],
      photo: params[:photo]
    )

    if item.save
      {id: item.id}
    else
      status 422
      {errors: item.errors}
    end
  end

  params do
    requires :id, type: Integer
    requires :title, type: String
    requires :description, type: String
    requires :value, type: Float
    requires :selling, type: String
    optional :photo, type: String
  end
  put do
    item = Item.find(params[:id])
    item.title = params[:title]
    item.description = params[:description]
    item.value = params[:value]
    item.selling = params[:selling]
    item.photo = params[:photo]

    if not item.save
      status 422
      {errors: item.errors}
    end
  end

  params do
    requires :id, type: Integer
  end
  delete do
    item = Item.find(params[:id])
    if not item.destroy
      status 422
      {errors: item.errors}
    end
  end
end
