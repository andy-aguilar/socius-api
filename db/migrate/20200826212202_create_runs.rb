class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.integer :distance
      t.string :name
      t.boolean :complete

      t.timestamps
    end
  end
end
