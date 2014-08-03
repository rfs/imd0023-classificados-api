class User < ActiveRecord::Base
  has_many :items

  class Entity < Grape::Entity
    root 'users', 'user'
    expose :id, :email, :name, :phone, :avatar
  end
end
