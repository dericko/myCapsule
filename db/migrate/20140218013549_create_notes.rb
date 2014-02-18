class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.timestamp :maketime
      t.integer :timer
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
