require 'csv'

namespace :import do
  desc "Import customers from csv"
  task customers: :environment do
    filename = File.join Rails.root, "db/data/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
      info = row.to_hash
      Customer.create(id: info["id"], first_name: info["first_name"], last_name: info["last_name"], created_at: info["created_at"], updated_at: info["updated_at"])
    end
  end
end
