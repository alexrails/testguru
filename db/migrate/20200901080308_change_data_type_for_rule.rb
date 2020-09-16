class ChangeDataTypeForRule < ActiveRecord::Migration[6.0]
  def change
    change_column :badges, :rule, :integer, using: 'rule::integer'
  end
end
