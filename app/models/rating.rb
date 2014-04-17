class Rating < ActiveRecord::Base

  belongs_to :property
  belongs_to :user

end
