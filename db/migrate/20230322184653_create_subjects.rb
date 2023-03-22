class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title, index: {unique: true}, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
