class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :specialization
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
