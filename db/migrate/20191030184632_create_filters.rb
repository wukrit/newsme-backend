class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters, &:timestamps
  end
end
