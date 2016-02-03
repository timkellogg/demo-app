class AddProcessedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :processed, :boolean, default: true
  end
end
