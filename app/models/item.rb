class Item < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  belongs_to :user
  belongs_to :category



  def active_model_serializer
    ItemSerializer 
  end
end
