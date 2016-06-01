require 'csv'

namespace :import do
  desc "Import invoice items from csv"
  task invoice_items: :environment do
    filename = File.join Rails.root, "db/data/invoice_items.csv"
    CSV.foreach(filename, headers: true) do |row|
    info = row.to_hash
    InvoiceItem.create(id: info["id"], item_id: info["item_id"], invoice_id: info["invoice_id"], quantity: info["quantity"], unit_price: info["unit_price"], created_at: info["created_at"], updated_at: info["updated_at"] )
    end
  end
end
