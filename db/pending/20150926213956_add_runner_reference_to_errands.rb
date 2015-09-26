class AddRunnerReferenceToErrands < ActiveRecord::Migration
  def change
    add_reference :errands, :runner, index: true
  end
end
