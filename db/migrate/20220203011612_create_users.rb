class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :password
      t.bigint :count_link
      t.string :status

      t.timestamps
    end
  end
end
