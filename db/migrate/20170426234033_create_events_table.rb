class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :cutoff_time, null: false
      t.string :date, null: false
      t.string :time, null: false
      t.string :location, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
