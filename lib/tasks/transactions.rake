require 'csv'

namespace :import do
  desc "Import transactions from csv"
  task transactions: :environment do
    filename= File.join Rails.root, "Db/data/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
      info = row.to_hash
      Transaction.create(invoice_id: info["invoice_id"], credit_card_number: info["credit_card_number"], credit_card_expiration_date: info["credit_card_expiration_date"], date: info["date"], result: info["result"], created_at: info["created_at"], updated_at: info["updated_at"])
    end
  end
end
