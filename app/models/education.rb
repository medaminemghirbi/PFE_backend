class Education < ActiveRecord::Base

  belongs_to :user

  validate :dateDebut_before_dateFin?

  def dateDebut_before_dateFin?
    if dateDebut > dateFin 
      errors.add :dateDebut, "dateDebut must be before dateFin "
    end
  end
  

end