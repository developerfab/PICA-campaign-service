class CreateProductCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :product_campaigns do |t|
      t.references :campaign, foreign_key: true
      t.integer :product_id
      t.float :value
      t.float :discount

      t.timestamps
    end
  end
end
