class ItemSerializer < ActiveModel::Serializer
  attributes :id, :category


  def category
      ################### overriding category
      #### this is null now....
  end

end
