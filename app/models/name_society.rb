class NameSociety < ActiveRecord::Base

    belongs_to :name
    belongs_to :society


    def self.search(search, page)
      paginate :per_page => 25, :page => page,
               :conditions => [' carica LIKE ? or inizio_carica LIKE ? or fine_carica LIKE ? or societies.denominazione LIKE ?
                  or names.cognome_nome LIKE ? or note LIKE ?', 
                 "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"],
               :include => [:name, :society],
               :order => 'names.cognome_nome'
    end


  end
