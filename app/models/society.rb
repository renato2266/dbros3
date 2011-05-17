class Society < ActiveRecord::Base
  validates_presence_of :denominazione, :message => "non e stata inserita la denominazione!"
  validates_uniqueness_of :denominazione, :message => "ce gia un'altra societa con lo stesso nome!"
  
  has_and_belongs_to_many :names
  has_and_belongs_to_many :dossiers
  has_and_belongs_to_many :fascicles
  
  has_many :name_societies, :dependent => :destroy
  has_many :names,  :through => :name_societies
  
  
  
    has_attached_file :photo, :styles => { :small => "300x300>" },
    :url  => "/assets/avatar/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/avatar/:id/:style/:basename.:extension"
  
  
  
  def self.search(search, page)
    paginate :per_page => 25, :page => page,
             :conditions => ['denominazione LIKE ? or forma_giuridica LIKE ? or sede LIKE ? or cf_pi LIKE ? or descrizione LIKE ? 
              or carica LIKE ? or inizio_carica LIKE ? or fine_carica LIKE ? or agenzia_mandataria LIKE ? or names.cognome_nome LIKE ?', 
              "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%",
              "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%",],
             :include => [:names],
             :order => 'societies.denominazione'
  end
  
  
  
end
