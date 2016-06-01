require 'csv'

namespace :import do
  desc "Import invoices from csv"
  task invoices: :environment do
    filename = File.join Rails.root, "db/data/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
    Invoice.create(row.to_hash)
    end
  end
end
