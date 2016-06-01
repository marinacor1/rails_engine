require 'csv'

namespace :import do
  desc "Import items from csv"
  task items: :environment do
    filename= File.join Rails.root, "Db/data/items.csv"
    CSV.foreach(filename, headers: true) do |row|
      info = row.to_hash
      Item.create(name: info["name"], description: info["description"], unit_price: info["unit price"].to_i, merchant_id: info["merchant_id"], created_at: info["created_at"], updated_at: info["updated_at"])
    end
  end
end
