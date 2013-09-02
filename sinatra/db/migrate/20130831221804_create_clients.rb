class CreateClients < ActiveRecord::Migration
  def self.up
  	create_table(:clients) do |t|
  		t.string :full_name
  		t.string :email
  		t.string :phone_number
  		t.text	 :description
  	end
  	add_index :clients, [:email, :full_name]
  end

  def self.down
  	drop_table(:clients)
  end
end
