class CreateTesings < ActiveRecord::Migration
  def change
    create_table :tesings do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
