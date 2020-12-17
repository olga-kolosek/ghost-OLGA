class RemoveDateEditedFromStories < ActiveRecord::Migration[6.0]
  def change
    remove_column :stories, :date_edited, :datetime
  end
end
