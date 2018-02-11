class CreateSermons < ActiveRecord::Migration[5.1]
  def change
    create_table :sermons do |t|
      t.text :title
      t.text :speaker
      t.datetime :date

      t.timestamps
    end
  end
end
