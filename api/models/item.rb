class Item < ActiveRecord::Base
  belongs_to :user

  class Entity < Grape::Entity
    root 'items', 'item'
    expose :id, :title, :description, :value, :selling, :photo
  end
end
