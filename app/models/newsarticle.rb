class Newsarticle < ApplicationRecord
    before_validation :set_publish_date
    after_validation :titlized

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true


    

private


    def set_publish_date
        self.published_at = DateTime.now
    end

    def titlized
        if self.title?
            self.title = self.title.titleize
        end
    end

end
