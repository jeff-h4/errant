class ErrandSerializer < ActiveModel::Serializer
  attributes :id, :title, :item_name, :price, :store, :owner, :runner
  def owner
    owner.full_name
  end
  def runner
    runner.full_name
  end
end
