class AddBucketToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :bucket, :integer
  end
end
