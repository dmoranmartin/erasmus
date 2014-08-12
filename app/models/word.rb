class Word < ActiveRecord::Base
validates :name, :origin, :definition, :photo, :video, :example, presence: true
end
