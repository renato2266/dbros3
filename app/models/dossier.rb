class Dossier < ActiveRecord::Base
  has_and_belongs_to_many :names

  has_and_belongs_to_many :associations
  has_and_belongs_to_many :unions
  has_and_belongs_to_many :societies


	validates_attachment_presence :documento, :message => ":  campo vuoto!"
	
  has_attached_file :documento, 
    :url  => "/assets/dossiers/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/dossiers/:id/:style/:basename.:extension"
    
    


end
