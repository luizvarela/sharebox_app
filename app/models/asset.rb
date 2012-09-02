class Asset < ActiveRecord::Base
  attr_accessible :user_id, :uploaded_file, :folder_id
  
  belongs_to :folder
  belongs_to :user
  
  has_attached_file :uploaded_file
  
  has_attached_file :uploaded_file,  
               :url => "/assets/get/:id",  
               :path => ":rails_root/assets/:id/:basename.:extension"  
  
  validates_attachment_size :uploaded_file, :less_than => 10.megabytes
  validates_attachment_presence :uploaded_file
  
  def file_name
    uploaded_file_file_name
  end
 #This method acts as an alias for uploaded_file_file_size
  def file_size
    uploaded_file_file_size
  end
end
