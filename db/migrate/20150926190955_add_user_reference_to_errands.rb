class AddUserReferenceToErrands < ActiveRecord::Migration
  def change
    add_reference :errands, :user, index: true, foreign_key: true
  end
end
