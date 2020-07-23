class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title
      t.string :file
      t.string :resume
      t.integer :duration

      t.timestamps
    end
  end
end
