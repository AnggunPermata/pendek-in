class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :link_source
      t.string :link_short

      t.timestamps
    end
  end
end
