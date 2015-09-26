class AddRunnerReferenceToErrands < ActiveRecord::Migration
  def change
    add_reference :errands, :runner, index: true, foreign_key: true
  end
end
