require 'csv'

namespace :import do
  desc "Import customers from csv"
  task customers: :environment do
    filename = File.join Rails.root, "db/data/customers.csv"
    CSV.foreach(filename, headers: true) do |row|
      Customer.create(row.to_hash)
    end
  end
end
