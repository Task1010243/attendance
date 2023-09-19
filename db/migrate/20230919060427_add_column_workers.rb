class AddColumnWorkers < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :birth_day, :datetime
    add_column :workers, :pre_pto, :float
    add_column :workers, :pto, :float
    add_column :workers, :rest_time_pto, :float
  end
end
