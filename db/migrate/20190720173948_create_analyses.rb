class CreateAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :analyses do |t|
      t.boolean :stop_word
      t.text :words

      t.timestamps
    end
  end
end
