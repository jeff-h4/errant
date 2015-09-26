class AddOwnerReferenceToErrands < ActiveRecord::Migration
  def change
    add_reference :errands, :owner, index: true, foreign_key: true
  end
end
