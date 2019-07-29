class AddIsNotFinishedToResult < ActiveRecord::Migration[5.2]
  def up
    add_column :results, :is_not_finished, :boolean, default: true
    execute("update results set is_not_finished = false;")
  end

  def down
    remove_column :results, :is_not_finished
  end
end
