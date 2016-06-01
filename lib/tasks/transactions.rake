require 'csv'

namespace :import do
  desc "Import transactions from csv"
  task transactions: :environment do
    filename= File.join Rails.root, "Db/data/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
      Transaction.create(row.to_hash)
    end
  end
end
