class CreateTopartists < ActiveRecord::Migration
  def change
    create_table :topartists do |t|
    	t.string :name
    end
  end
end
