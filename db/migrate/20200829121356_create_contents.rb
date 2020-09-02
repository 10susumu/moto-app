class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :user,  null: false
      t.string     :text,  null: false
      t.string     :map
      t.timestamps
    end
  end
end
