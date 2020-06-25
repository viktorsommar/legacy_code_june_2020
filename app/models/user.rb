class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { maximum: 10 }
  validates :name, presence: true
  validates_uniqueness_of :name

  acts_as_messageable

  def mailboxer_name
    name
  end

  def mailboxer_email(object)
    email
  end

  # def name(length)
  #   case 
  #   when name_is_too_long?(name, length)
  #     { status: false, message: 'Name is too long (maximum is 10 characters)' }
  # #   else


      
  #   end
end
