class RemoveAuthorFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :author
  end
end
