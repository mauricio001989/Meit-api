class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :name, nill: false
      t.string :city, nill: false

      t.timestamps
    end
  end
end
