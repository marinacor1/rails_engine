require 'csv'

namespace :import do

  desc "Import merchants from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "db/data/merchants.csv"
    CSV.foreach(filename, headers: true) do |row|
      print row
    end
  end
end
