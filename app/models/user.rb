class User < ActiveRecord::Base
  validates :name,  :presence => true
  validates :password,  :presence => true

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("email LIKE ?", "%#{search}%")
  end

end
