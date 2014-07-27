class AddAuthorToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :author, :text
  end
end
