class Union < ActiveRecord::Base
belongs_to :area

has_and_belongs_to_many :dossiers
has_and_belongs_to_many :names
has_and_belongs_to_many :fascicles

def self.search(search)
  if search
    where('denominazione LIKE ?  or sede LIKE ?  or descrizione LIKE ? or areas.area_criminale LIKE ? or names.cognome_nome LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%").includes(:names, :area)
else
    scoped
  end
end
  
end

  
