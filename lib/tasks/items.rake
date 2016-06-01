require 'csv'

namespace :import do
  desc "Import items from csv"
  task items: :environment do
    filename= File.join Rails.root, "Db/data/items.csv"
    CSV.foreach(filename, headers: true) do |row|
      Item.create(row.to_hash)
  end
end
end
