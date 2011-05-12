class Association < ActiveRecord::Base
belongs_to :area
has_many :names

has_and_belongs_to_many :dossiers
has_and_belongs_to_many :fascicles



end
