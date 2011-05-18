class Name < ActiveRecord::Base

belongs_to :area
belongs_to :ambit
belongs_to :association

has_and_belongs_to_many :dossiers
has_and_belongs_to_many :unions
has_and_belongs_to_many :fascicles
has_and_belongs_to_many :galleries
has_and_belongs_to_many :investigations

  validates_uniqueness_of :cognome_nome, :case_sensitive => false, :message => ":  nome gia' presente!"
  validates_presence_of :cognome_nome, :message => ":  campo vuoto!"

  has_attached_file :photo, :styles => { :medium => "600x600>",
										:small => "300x300>",	:thumb => "100x100>" },
                    :url  => "/assets/avatar/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/avatar/:id/:style/:basename.:extension"


def self.search(search)
  if search
    where('cognome_nome LIKE ? or luogo_nascita LIKE ? or data_nascita LIKE ? or residenza LIKE ? or cittadinanza LIKE ?
          or ambits.ambito_criminale LIKE ? or areas.area_criminale LIKE ? or associations.associazione_criminale LIKE ?',
          "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%","%#{search}%","%#{search}%","%#{search}%", "%#{search}%").includes(:ambit, :area, :association)
  else
    scoped
  end
end


end






