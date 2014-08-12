class Word < ActiveRecord::Base
validates :name, :locale, presence: true
has_many :definitions
end
