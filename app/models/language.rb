class Language < ApplicationRecord

    has_many :mission_languages , dependent: :destroy

    Language.has_many :missions , through: :mission_languages

    has_many :freelancer_languages , dependent: :destroy

    Language.has_many :users , through: :freelancer_languages

    #has_many :freelancers  , dependent: :destroy

end
