class ChangeNameAndDescriptionTypeInQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :name, :string
    add_reference :questions, :name
    add_foreign_key :questions, :translations, column: :name_id
    remove_column :questions, :description, :text
    add_reference :questions, :description
    add_foreign_key :questions, :translations, column: :description_id
  end

end
