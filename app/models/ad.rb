class Ad < ApplicationRecord
#validates :ad, uniqueness: { case_sensitive: true }
    belongs_to :user
    has_one_attached :image
    has_one_attached :instruction
    has_and_belongs_to_many :tags, presence: true

    validates :title, presence: true
    validates :category, presence: true
    accepts_nested_attributes_for :tags

 end

 class Tag < ApplicationRecord
   validates :title, presence: true
 end
