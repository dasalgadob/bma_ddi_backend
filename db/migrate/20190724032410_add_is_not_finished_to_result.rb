class AddIsNotFinishedToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :is_not_finished, :boolean, default: false
    execute("update results set is_not_finished = true;")
  end
end
