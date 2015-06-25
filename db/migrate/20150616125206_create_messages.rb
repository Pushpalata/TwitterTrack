class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :uid
      t.string :from_user

      t.timestamps
    end
  end
end
