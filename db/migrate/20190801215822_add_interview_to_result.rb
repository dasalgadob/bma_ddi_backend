class AddInterviewToResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :interview, foreign_key: true
  end
end
