class ChangeWorkersHireDate < ActiveRecord::Migration[7.0]
  def change
    change_column :workers, :hire_date, :datetime
  end
end
