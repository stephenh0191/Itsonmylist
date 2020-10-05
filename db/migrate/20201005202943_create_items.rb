class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.description :title

      t.timestamps
    end
  end
end
