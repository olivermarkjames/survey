# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bucket      :integer
#

class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id
  belongs_to :question

  def add
  	   if self.bucket == nil
  	   	self.update_attribute(:bucket, 0)
  	   end
  	  self.update_attribute(:bucket, self.bucket+1 )
  end

end
