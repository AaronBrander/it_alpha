class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :subdomain
      t.string :name
      t.text :description
      t.text :keywords
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :contact_email
      t.integer :state
      t.boolean :is_private

      t.timestamps
    end

    add_index :boards, :subdomain, unique: true
  end
end
