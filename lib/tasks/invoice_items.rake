require 'csv'

namespace :import do
  desc "Import invoice items from csv"
  task invoice_items: :environment do
    filename = File.join Rails.root, "db/data/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
    InvoiceItem.create(row.to_hash)
    end
  end
end
