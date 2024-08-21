class CreateBucketItems < ActiveRecord::Migration[7.2]
  def change
    create_table :bucket_items do |t|
      t.references :bucket, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
