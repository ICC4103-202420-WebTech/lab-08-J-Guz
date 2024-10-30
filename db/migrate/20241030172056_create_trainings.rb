class CreateTrainings < ActiveRecord::Migration[7.2]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :activity
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
