class Area < ActiveRecord::Base
has_many :names
belongs_to :ambit
has_many :associations
has_many :unions

end
