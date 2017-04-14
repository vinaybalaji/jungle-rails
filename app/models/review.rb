class Review < ActiveRecord::Base
  attr_accessor :rating_options

  belongs_to :product
  belongs_to :user

  validates :rating, presence: true

  def initiatize
    @rating_options = [1, 2, 3, 4, 5]
  end

end
