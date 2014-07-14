class CreateSampleUdfViews < ActiveRecord::Migration
  def change
    create_table :sample_udf_views do |t|

      t.timestamps
    end
  end
end
