class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, nill: false
      t.string :email, nill: false
      t.string :password_digest, nill: false

      t.timestamps
    end
  end
end
