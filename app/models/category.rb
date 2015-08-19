class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name , use: :slugged

  belongs_to :user
  has_many :items

  def active_model_serializer
    TopicSerializer #############topic ==== category olacak....
  end

end
