class RemoveDateFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :date, :string
  end
end
