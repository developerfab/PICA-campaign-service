class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.datetime :start_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
