class Word < ActiveRecord::Base
validates :name, :language, presence: true
has_many :definitions
end
