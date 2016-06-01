require 'csv'

namespace :import do
  desc "Import merchants from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "db/data/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
    info = row.to_hash
    Merchant.create(id: info["id"], name: info["name"], created_at: info["created_at"], updated_at: info["updated_at"] )
    end
  end
end
