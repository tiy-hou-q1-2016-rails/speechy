class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.string :author
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
