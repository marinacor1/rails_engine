require 'csv'

namespace :import do
  desc "Import invoices from csv"
  task invoices: :environment do
    filename = File.join Rails.root, "db/data/invoices.csv"
    CSV.foreach(filename, headers: true) do |row|
    info = row.to_hash
    Invoice.create(id: info["id"], customer_id: info["customer_id"], merchant_id: info["merchant_id"], status: info["status"], created_at: info["created_at"], updated_at: info["updated_at"] )
    end
  end
end
