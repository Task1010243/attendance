class CreatePaidHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :paid_holidays do |t|
      t.references :used_worker, foreign_key: { to_table: :workers}
      t.datetime :first_period
      t.datetime :end_period
      t.string :type
      t.string :substitute_worker1
      t.string :substitute_worker2
      t.float :used_days

      t.timestamps
    end
  end
end
