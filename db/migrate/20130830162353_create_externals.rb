class CreateExternals < ActiveRecord::Migration
  def change
    create_table :externals do |t|

      t.timestamps
    end
  end
end
